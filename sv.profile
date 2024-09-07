SV_DIR="${PWD%/*}"

which ns >/dev/null 2>/dev/null
ns_installed=$?; ns_installed=$((ns_installed+1)); ns_installed=$((ns_installed%2))

if [[ $ns_installed -eq 0 ]]; then
    echo "Error: sv requires dot-ns" >&2
    echo "Resolve steps:" >&2
    echo $'\t'"1) download the dot-ns repository*. e.g., save to ~/dot-ns" >&2
    echo $'\t'"2) export dot-ns in the PATH var. e.g., export PATH=\"\${PATH}:~/dot-ns\"" >&2
    echo $'\t'"3) optionally, place #2 line in ~/.bashrc to apply to all shell sessions" >&2
    echo '* repository: https://github.com/koreyhinton/dot-ns' >&2
    exit 1
fi

if [[ -z "$NS_SHELL_PID" ]]; then
    . ns init
fi

if [[ -z "$NS_PATH" ]]; then
    export NS_PATH="${SV_DIR}/commands"
else
    export NS_PATH="${NS_PATH}:${SV_DIR}/commands"
fi

export NS_PATH="${NS_PATH}:${SV_DIR}/functions"
export NS_PATH="${NS_PATH}:${SV_DIR}/test"

# . ns delete ns_installed

echo "sv program"
echo $'\t' type \'exit\' to end this session
echo $'\t' type \'. ns run add\' after assigning necessary 'sv_*' vars to add a record
echo $'\t' $'\t' required
echo $'\t' $'\t' $'\t' - sv_file
echo $'\t' $'\t' $'\t' - sv_\$mycolname
echo $'\t' $'\t' optional
echo $'\t' $'\t' $'\t' - sv_sep \(default is ,\)
echo
echo Add Record example \(pipe-separated .txt file\)
echo $'\t' sv_sep=\'\|\'
echo $'\t' sv_file=transactions/out-of-state.txt
echo $'\t' sv_tx_date=2024-07-20
echo $'\t' sv_tx_name=cheerwine
echo $'\t' sv_tx_cost=2
echo $'\t' . ns run add
echo
echo "root store names"
dir_count=$(ls -d */ 2>/dev/null | wc -l)
if [[ $dir_count -gt 0 ]]; then
    for dir in `ls -d */ | sort --version-sort`
    do
        echo $'\t' "$dir"
    done
else
    echo $'\t' none found
fi
echo

