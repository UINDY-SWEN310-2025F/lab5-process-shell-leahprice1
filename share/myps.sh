if [ -z "$1" ]; then
    echo "Usage: $0 <PID>"
    exit 1
fi

PID="$1"

FORMAT="f,s,uid,pid,ppid,c,pri,ni,addr,sz,wchan,tty,time,cmd"

OUTPUT=$(ps -p "$PID" --no-headers -o "$FORMAT")

if [ -z "$OUTPUT" ]; then
    echo "no process found for $PID"
    exit 1
fi

echo "F S UID PID PPID C PRI NI ADDR SZ WCHAN TTY TIME CMD"

echo "$OUTPUT"