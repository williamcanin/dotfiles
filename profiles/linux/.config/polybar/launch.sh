#!/usr/bin/env sh

## DEPRECATED
## Set env MONITOR
#MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g')

## Terminate already running bar instances
#killall -q polybar

## Wait until the processes have been shut down
#while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

## Launch example
#polybar mybar &



## Terminate already running bar instances
## If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
## Otherwise you can use the nuclear option:
## killall -q polybar

## Launch bar1 and bar2
echo "---" | tee -a /tmp/mybar.log
polybar mybar 2>&1 | tee -a /tmp/mybar.log & disown
echo "Bars launched..."


## DEPRECATED
## Terminate already running bar instances
## If all your bars have ipc enabled, you can use
## polybar-msg cmd quit
## Otherwise you can use the nuclear option:
#killall -q polybar

## Adicione uma pequena pausa para garantir que o processo morreu
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch bar1 and bar2
#echo "---" | tee -a /tmp/mybar.log
#polybar mybar 2>&1 | tee -a /tmp/mybar.log & disown

#echo "Bars launched..."
