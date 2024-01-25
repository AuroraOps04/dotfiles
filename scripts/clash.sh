#/usr/bin/bash
# 默认显示当前的clash节点和延迟
# 当点击的时候向shell 发送信号 USR1 然后切换节点（）
#
t=0
sleep_pid=0

toggle() {
	t=$((($t + 1) % 2))
	if [ "$sleep_pid" -ne 0 ]; then
		kill $sleep_pid >/dev/null 2>&1
	fi
}
# 当shell接收到信号的时候执行 toggle 函数 （这里可能是起了一个子进程， 可以测试以下）
trap "toggle" USR1

# ms
timeout=0
max_timout=1500
for ((i = 0; i < 1000; i++)); do
	if [ $t -eq 0 ]; then
		proxy=$(journalctl -u clash.service -n 100 | awk '{match($0,/^.*using (.*)\[(.*)\]".*$/,arr);if(arr[1] != "DIRECT" && arr[1] != ""){print arr[2]}}' | tail -n 1)
		proxy_group=$(journalctl -u clash.service -n 100 | awk '{match($0,/^.*using (.*)\[(.*)\]".*$/,arr);if(arr[1] != "DIRECT" && arr[1] != ""){print arr[1]}}' | tail -n 1)
		tmp_timeout=$(
			python <<EOF
import urllib.request
import urllib.parse
import json

proxy = "$proxy_group"
try:
    res = urllib.request.urlopen(
		# curl 命令获取节点的延迟， NOTE: 关键点 urlencode
        f"http://localhost:9090/proxies/{urllib.parse.quote(proxy)}/delay?timeout=$max_timout&url=https://github.com"
    )
except:
    pass
else:
    print(json.load(res.fp)["delay"])
EOF
		)
		if [ $tmp_timeout ]; then
			timeout=$tmp_timeout
		fi
		echo "$proxy|$timeout ms"

	# else
	#  # TODO: 换节点
	# 	echo "false: $i"
	fi
	sleep 60 &
	sleep_pid=$!
	wait
done
