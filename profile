# Stefans Custom bash setup
#

# export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@macdog\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
export PS1="\h@\[\033[32m\]\u\[\033[00m\]:\w$ "
export PATH=$PATH:/opt/datadog-agent/bin/agent
export BASH_SILENCE_DEPRECATION_WARNING=1
set -o vi
set bell-style none
alias k=/usr/local/bin/kubectl

# Creats alias for the CLI help files
#
printf "Creating aliases: "
for file in ~/helpfiles/*.txt; do
    if [ -f "$file" ]; then
        # Get just the filename without path and extension
        filename=$(basename "$file" .txt)
        
        # Create alias command that will cat the file
        # echo "creating alias $filename='cat $file'"
        printf "$filename  "
        alias $filename="cat $file"
    fi
done
printf "\n"

env |grep DD
printf "\n\n"
