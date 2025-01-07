for package in $(cat packages); do
    echo "Benchmarking $package"
    start=$(date +%s)
    pushd ..
    $(nix-build -A $package.fetch-deps)
    popd
    end=$(date +%s)
    echo "Time taken: $((end-start)) seconds" >> results-2/$package
done
