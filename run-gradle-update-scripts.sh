for script in $(cat gradle-update-scripts); do
  start=$(date +%s)
  bash $script
  end=$(date +%s)
  echo "Took $((end - start)) seconds for $(rg 'outPath' $script) in $script" >> gradle-update-script-times
done
