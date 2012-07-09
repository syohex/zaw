#
# zaw-src-gitdir
#
# zaw source for git command
#

function zaw-src-gitdir () {
    _dir=$(git rev-parse --show-cdup 2>/dev/null)
    if [ $? -eq 0 ]
    then
        candidates=( $(git ls-files ${_dir} | perl -MFile::Basename -nle \
                       '$a{dirname $_}++; END{delete $a{"."}; print for sort keys %a}') )

#        for dir in $(git ls-files ${_dir} | perl -MFile::Basename -nle \
#                    '$a{dirname $_}++; END{delete $a{"."}; print for sort keys %a}')
#        do
#            candidates+=("${dir}")
#        done
    fi

    actions=("zaw-src-gitdir-cd")
    act_descriptions=("change directory in git repos")
}

function zaw-src-gitdir-cd () {
    BUFFER="cd $1"
    zle accept-line
}

zaw-register-src -n gitdir zaw-src-gitdir
