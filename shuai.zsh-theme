# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# Mar 2013 Yad Smood


# VCS
SHUAI_VCS_PROMPT_PREFIX1=" <%{$fg[white]%}⑂:%{$reset_color%}"
SHUAI_VCS_PROMPT_PREFIX2="%{$fg[cyan]%}"
SHUAI_VCS_PROMPT_SUFFIX="%{$reset_color%}>"
SHUAI_VCS_PROMPT_DIRTY="%{$fg[red]%}+"
SHUAI_VCS_PROMPT_CLEAN="%{$fg[green]%}"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${SHUAI_VCS_PROMPT_PREFIX1}${SHUAI_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$SHUAI_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$SHUAI_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$SHUAI_VCS_PROMPT_CLEAN"

# HG info
local hg_info='$(shuai_hg_prompt_info)'
shuai_hg_prompt_info() {
	# make sure this is a hg dir
	if [ -d '.hg' ]; then
		echo -n "${SHUAI_VCS_PROMPT_PREFIX1}hg${YS_VCS_PROMPT_PREFIX2}"
		echo -n $(hg branch 2>/dev/null)
		if [ -n "$(hg status 2>/dev/null)" ]; then
			echo -n "$SHUAI_VCS_PROMPT_DIRTY"
		else
			echo -n "$SHUAI_VCS_PROMPT_CLEAN"
		fi
		echo -n "$SHUAI_VCS_PROMPT_SUFFIX"
	fi
}

local exit_code="%{$fg[green]%}%(?..%{$fg[green]%}%{$fg[red]%})"
# Full Date 
local SHUAI_DATE='$(date +"%Y-%m-%d %H:%M:%S")'

# Prompt format:
#
# PRIVILEGES USER @ MACHINE in DIRECTORY on git:BRANCH STATE [TIME] C:LAST_EXIT_CODE
# $ COMMAND
#
# For example:
#
# % ys @ ys-mbp in ~/.oh-my-zsh on git:master x [21:47:42] C:0
# $
# 
PROMPT="
%{$terminfo[bold]$fg[blue]%}$ %{$reset_color%}\
[ %(#,%{$bg[yellow]%}%{$fg[black]%}%n%{$reset_color%},%{$fg[cyan]%}%n)\
%{$fg[white]%}@\
%{$fg[green]%}%m:\
%{$fg[white]%} \
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
 ]\
${hg_info}\
${git_info}\
%{$fg[white]%}  ☀︎   $SHUAI_DATE 
%{$terminfo[bold]%}$exit_code> \
%{$reset_color%}"
