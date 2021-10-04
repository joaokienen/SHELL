#!/bin/sh

###################################################################################################################################
#                                                                                                                                 #
# Script para validar e monitorar todos os servidores                                                                             #
# Script to validate and monitor all servers                                                                                      #
#                                                                                                                                 #
# Data de criação: 10/09/2021 | João Kienen                                                                                       #
#                                                                                                                                 #
# Exemplo de uso: ./MonitorTmux.sh                                                                                                #
#                                                                                                                                 #
###################################################################################################################################

# Validar nome de sessão:
SESSION="Monitor"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Criar sessão somente se ainda não existir:
if [ "$SESSIONEXISTS" = "" ]
then
    # Inicia uma nova sessão:
    tmux new-session -d -s $SESSION

    # Monitora os cPanels 1-3:
    tmux rename-window -t 0 '[Servers 1-3]'
    tmux send-keys 'ssh user@server -p 22' C-m 'htop' C-m # Server-01
    tmux split-window -h
    tmux send-keys 'ssh user@server -p 22' C-m 'watch df -h' C-m # Server-01
    tmux split-window -v
    tmux send-keys 'ssh user@server -p 22' C-m 'watch df -h' C-m # Server-02
    tmux split-window -v
    tmux send-keys 'ssh user@server -p 22' C-m 'watch df -h' C-m # Server-03
    tmux select-pane -t 0
    tmux split-window -v
    tmux send-keys 'ssh user@server -p 22' C-m 'htop' C-m # Server-02
    tmux split-window -v
    tmux send-keys 'ssh user@server -p 22' C-m 'htop' C-m # Server-03

    # Monitora os cPanels 4-6:
    tmux new-window -t 1 -n '[Servers 4-6]'
    tmux send-keys 'ssh user@server -p 22' C-m 'htop' C-m # Server-04
    tmux split-window -h
    tmux send-keys 'ssh user@server -p 22' C-m 'watch df -h' C-m # Server-04
    tmux split-window -v
    tmux send-keys 'ssh user@server -p 22' C-m 'watch df -h' C-m # Server-05
    tmux split-window -v
    tmux send-keys 'ssh user@server -p 22' C-m 'watch df -h' C-m # Server-06
    tmux select-pane -t 0
    tmux split-window -v
    tmux send-keys 'ssh user@server -p 22' C-m 'htop' C-m # Server-05
    tmux split-window -v
    tmux send-keys 'ssh user@server -p 22' C-m 'htop' C-m # Server-06

fi

# Inicializar sessão:
tmux attach-session -t $SESSION:0
