
_git_yui () {
	local i c=1 command __git_dir

	while [ $c -lt $COMP_CWORD ]; do
		i="${COMP_WORDS[c]}"
		case "$i" in
		--git-dir=*) __git_dir="${i#--git-dir=}" ;;
		--bare)      __git_dir="." ;;
		--version|-p|--paginate) ;;
		--help) command="help"; break ;;
		*) command="$i"; break ;;
		esac
		c=$((++c))
	done
    
    if [ "$command" == "yui" ]; then
	    #local cur="${COMP_WORDS[COMP_CWORD]}"
	    local subcommands="up merge sync build docs lint forks pullrequest create network commits comment ticket my log"
        __gitcomp "$subcommands"
    else
        _git
    fi
}

complete -o default -o nospace -F _git_yui git
