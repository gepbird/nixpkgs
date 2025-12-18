{ pkgs ? import ./default.nix {} }:
with pkgs;

[
  (fetchpatch2 {
    name = "fix-mtl-2.3.patch";
    url = "https://git.ps.informatik.uni-kiel.de/curry/curry-frontend/-/commit/3b26d2826141fee676da07939c2929a049279b70.diff";
    hash = "sha256-R3XjoUzAwTvDoUEAIIjmrSh2r4RHMqe00RMIs+7jFPY=";
  })
  (fetchpatch2 {
    name = "nix-2.31-14240-sri-error-message.patch";
    url = "https://github.com/NixOS/nix/commit/56751b1cd2c4700c71c545f2246adf602c97fdf5.patch";
    hash = "sha256-CerSBAI+H2RqPp9jsCP0QIM2rZYx3yBZHVVUAztgc18=";
  })
  (fetchpatch2 {
    name = "lix-lowdown-1.4.0.patch";
    url = "https://git.lix.systems/lix-project/lix/commit/858de5f47a1bfd33835ec97794ece339a88490f1.patch";
    hash = "sha256-FfLO2dFSWV1qwcupIg8dYEhCHir2XX6/Hs89eLwd+SY=";
  })
  (fetchpatch2 {
    url = "https://github.com/varnishcache/varnish-cache/commit/a95399f5b9eda1bfdba6ee6406c30a1ed0720167.patch";
    hash = "sha256-T7DIkmnq0O+Cr9DTJS4/rOtg3J6PloUo8jHMWoUZYYk=";
  })
  (fetchpatch2 {
    url = "https://raw.githubusercontent.com/buildroot/buildroot/2f0c31bffdb59fb224387e35134a6d5e09a81d57/package/nodejs/nodejs-src/0003-include-obj-name-in-shared-intermediate.patch";
    hash = "sha256-3g4aS+NmmUYNOYRNc6UMJKYoaTlpP5Knt9UHegx+o0Y=";
  })
  (fetchpatch2 {
    # this can be removed post 6.1
    name = "fix_build_failure_due_to_PropertyKey_EncoderID";
    url = "https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/cb049d377f54f6b747667a93e4b719380c3e9475";
    hash = "sha256-sxRXKKgUak5vsQTiV7ge8vp+N22CdTIvuczNgVRP72c=";
  })
  (fetchpatch2 {
    name = "binutils-2-43-compat.patch";
    url = "https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/654bd47716c4f36719fb0f3f7fd8386d5ed0b916";
    hash = "sha256-OLiQHKBNp2p63ZmzBBI4GEGz3WSSP+rMd8ITfZSVRgY=";
  })
  (fetchpatch2 {
    name = "lcevcdec-4.0.0-compat.patch";
    url = "https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/fa23202cc7baab899894e8d22d82851a84967848.patch";
    hash = "sha256-Ixkf1xzuDGk5t8J/apXKtghY0X9cfqSj/q987zrUuLQ=";
  })
  (fetchpatch2 {
    name = "rename_iszero";
    url = "https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/b27ae2c0b704e83f950980102bc3f12f9ec17cb0";
    hash = "sha256-l1t4LcUDSW757diNu69NzvjenW5Mxb5aYtXz64Yl9gs=";
  })
  (fetchpatch2 {
    name = "texinfo-7.1.patch";
    url = "https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/4d9cdf82ee36a7da4f065821c86165fe565aeac2";
    hash = "sha256-BZsq1WI6OgtkCQE8koQu0CNcb5c8WgTu/LzQzu6ZLuo=";
  })
  (fetchpatch2 {
    name = "unbreak-svt-av1-3.0.0.patch";
    url = "https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/d1ed5c06e3edc5f2b5f3664c80121fa55b0baa95";
    hash = "sha256-2NVkIhQVS1UQJVYuDdeH+ZvWYKVbtwW9Myu5gx7JnbA=";
  })
  (fetchpatch2 {
    url = "https://github.com/JuliaLang/julia/commit/0be37db8c5b5a440bd9a11960ae9c998027b7337.patch";
    revert = true;
    hash = "sha256-gXC3LE3AuHMlSdA4dW+rbAhJpSB6ZMaz9X1qrHDPX7Y=";
  })
  (fetchpatch2 {
    url = "https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/a02c1a15706ea832c0d52a4d66be8fb29499801a/add-av_stream_get_first_dts-for-chromium.patch";
    hash = "sha256-DbH6ieJwDwTjKOdQ04xvRcSLeeLP2Z2qEmqeo8HsPr4=";
  })
  (fetchpatch2 {
    url = "https://hg.mozilla.org/mozilla-central/raw-file/fb8582f80c558000436922fb37572adcd4efeafc/intl/icu-patches/bug-1790071-ICU-22132-standardize-vtzone-output.diff";
    stripLen = 3;
    hash = "sha256-MGNnWix+kDNtLuACrrONDNcFxzjlUcLhesxwVZFzPAM=";
  })
  (fetchpatch2 {
    name = "Net-IDN-Encode-use-uvchr_to_utf8_flags.patch";
    url = "https://github.com/cfaerber/Net-IDN-Encode/commit/3ebe6f2e239b470efcb64a044edc8202798188af.diff";
    hash = "sha256-t/BulZoyRvpi+TKNxKFxUS1y3X7bGi1sG7mG75nW/Gc=";
  })
  (fetchpatch2 {
    name = "cmake-fix.patch";
    url = "https://github.com/llvm/llvm-project/commit/3676a86a4322e8c2b9c541f057b5d3704146b8f3.patch?full_index=1";
    stripLen = 1;
    hash = "sha256-zP9dQOmWs7qrxkBRj70DyQBbRjH78B6tNJVy6ilA1xM=";
  })
  (fetchpatch2 {
    name = "find-cuda-toolkit-check-for-language-enablement.patch";
    url = "https://gitlab.kitware.com/cmake/cmake/-/commit/c5d81a246852e1ad81a3d55fcaff7e6feb779db7.patch";
    hash = "sha256-oGxzbp+x88+79V+Cyx0l7+nMxX+n3ixzAFKPK26NMI8=";
  })
  (fetchpatch2 {
    name = "fix_build_failure_due_to_libjxl_version_to_new";
    url = "https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/75b1a555a70c178a9166629e43ec2f6250219eb2";
    hash = "sha256-+2kzfPJf5piim+DqEgDuVEEX5HLwRsxq0dWONJ4ACrU=";
  })
  (fetchpatch2 {
    name = "future-proof-reference-to-deprecated-pytype_aval_mappings";
    url = "https://github.com/tensorflow/probability/commit/135080b6b1ac5724fc1731b0a9ca6f2010b1aea5.patch";
    hash = "sha256-27yWIw5pI86KcUz0TsYwRFyLDoeiqmxgsRMBXaauzVw=";
  })
  (fetchpatch2 {
    name = "lcevcdec-4.0.0-compat.patch";
    url = "https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/fa23202cc7baab899894e8d22d82851a84967848.patch";
    hash = "sha256-Ixkf1xzuDGk5t8J/apXKtghY0X9cfqSj/q987zrUuLQ=";
  })
  (fetchpatch2 {
    name = "update-arch-supported-by-cuda-12_8.patch";
    url = "https://gitlab.kitware.com/cmake/cmake/-/commit/a745b6869ee3681e39544d96d936c95c196c7398.patch";
    hash = "sha256-B6ny6AZFIcyFhsEnzNk7+vJTb36HeguM53sk/LCnjS4=";
  })
  (fetchpatch2 {
    url = "https://aur.archlinux.org/cgit/aur.git/plain/get-w32-console-maxcols.mingw32.patch?h=mingw-w64-popt&id=63f2cdb0de116362c49681cef20f7a8b4355e85a";
    sha256 = "zv43l1RBqNzT/JG+jQaMVFaFv+ZYPuIiAtKUDzJJBbc=";
    stripLen = 1;
    extraPrefix = "src/";
  })
  (fetchpatch2 {
    url = "https://github.com/bluskript/nix-inspect/commit/af4dd48d69f399c7b7e3f07d5268ade606a91f22.patch";
    hash = "sha256-ipyT/zr+CEZi8EPk6Tw8V58ukUdmrtXRn+H32Y7Csuw=";
  })
  (fetchpatch2 {
    url = "https://github.com/chromium/chromium/commit/2f39ac8d0a414dd65c0e1d5aae38c8f97aa06ae9.patch";
    hash = "sha256-3kA2os0IntxIiJwzS5nPd7QWYlOWOpoLKYsOQFYv0Sk=";
    stripLen = 1;
    extraPrefix = "src/3rdparty/chromium/";
  })
  (fetchpatch2 {
    url = "https://github.com/chromium/chromium/commit/66defc14abe47c0494da9faebebfa0a5b6efcf38.patch";
    hash = "sha256-ErS5Eycls5+xQLGYKz1r/tQC6IcRJWb/WoGsUyzO9WY=";
    stripLen = 1;
    extraPrefix = "src/3rdparty/chromium/";
  })
  (fetchpatch2 {
    url = "https://github.com/chromium/chromium/commit/9f43d823b6b4cdea62f0cc7563ff01f9239b8970.patch";
    hash = "sha256-2WCx+ZOWA8ZyV2yiSQLx9uFZOoeWQHxLqwLEZsV41QU=";
    stripLen = 1;
    extraPrefix = "src/3rdparty/chromium/";
  })
  (fetchpatch2 {
    url = "https://github.com/flask-restful/flask-restful/commit/6cc4b057e5450e0c84b3ee5f6f7a97e648a816d6.patch?full_index=1";
    hash = "sha256-kIjrkyL0OfX+gjoiYfchU0QYTPHz4JMCQcHLFH9oEF4=";
  })
  (fetchpatch2 {
    url = "https://github.com/freebsd/freebsd-ports/raw/0ddd6468fb3cb9ba390973520517cb1ca2cd690d/www/qt5-webengine/files/patch-libc++19";
    hash = "sha256-pSVPnuEpjFHW60dbId5sZ3zHP709EWG4LSWoS+TkgcQ=";
    extraPrefix = "";
  })
  (fetchpatch2 {
    url = "https://github.com/freebsd/freebsd-ports/raw/0ddd6468fb3cb9ba390973520517cb1ca2cd690d/www/qt5-webengine/files/patch-src_3rdparty_chromium_third__party_blink_renderer_platform_wtf_hash__table.h";
    hash = "sha256-+vyWC7Indd1oBhvL5fMTlIH4mM4INgISZFAbHsq32Lg=";
    extraPrefix = "";
  })
  (fetchpatch2 {
    url = "https://github.com/freebsd/freebsd-ports/raw/0ddd6468fb3cb9ba390973520517cb1ca2cd690d/www/qt5-webengine/files/patch-src_3rdparty_chromium_third__party_perfetto_include_perfetto_tracing_internal_track__event__data__source.h";
    hash = "sha256-DcAYOV9b30ogPCiedvQimEmiZpUJquk5j6WLjJxR54U=";
    extraPrefix = "";
  })
  (fetchpatch2 {
    url = "https://github.com/macports/macports-ports/raw/f9a4136c48020b01ecc6dffa99b88333c360f056/aqua/qt5/files/patch-qtwebengine-chromium-freetype-gzip.diff";
    hash = "sha256-NeLmMfYMo80u3h+5GTenMANWfWLPeS35cKg+h3vzW4g=";
    extraPrefix = "";
  })
  (fetchpatch2 {
    url = "https://github.com/macports/macports-ports/raw/f9a4136c48020b01ecc6dffa99b88333c360f056/aqua/qt5/files/patch-qtwebengine_chromium_static_page_size.diff";
    hash = "sha256-8TFN5XU0SUvPJCFU6wvcKP5a8HCd0ygUnLT8BF4MZ/E=";
    extraPrefix = "";
  })
  (fetchpatch2 {
    url = "https://github.com/nodejs/node/commit/869d0cbca3b0b5e594b3254869a34d549664e089.patch?full_index=1";
    hash = "sha256-BBBShQwU20TSY8GtPehQ9i3AH4ZKUGIr8O0bRsgrpNo=";
    revert = true;
  })
  (fetchpatch2 {
    url = "https://github.com/rpm-software-management/popt/commit/905544c5d9767894edaf71a1e3ce5126944c5695.patch";
    sha256 = "3PmcxeiEZ/Hof0zoVFSytEXvQ8gE8Sp5UdagExPVICU=";
    stripLen = 1;
    extraPrefix = "src/";
    revert = true;
  })
  (fetchpatch2 {
    url = "https://github.com/ruby/curses/commit/13e00d07c3aaed83d5f138cf268cc33c9f025d0e.patch?full_index=1";
    hash = "sha256-ZJ2egqj3Uwmi4KrF79dtwczpwUqFCp52/xQYUymYDmc=";
  })
  (fetchpatch2 {
    url = "https://gitlab.archlinux.org/archlinux/packaging/packages/qt5-webengine/-/raw/14074e4d789167bd776939037fe6df8d4d7dc0b3/qt5-webengine-ffmpeg5.patch";
    hash = "sha256-jTbJFXBPwRMzr8IeTxrv9dtS+/xDS/zR4dysV/bRg3I=";
    stripLen = 1;
    extraPrefix = "src/3rdparty/";
  })
  (fetchpatch2 {
    url = "https://gitlab.archlinux.org/archlinux/packaging/packages/qt5-webengine/-/raw/c9db2cd9e144bd7a5e9246f5f7a01fe52fd089ba/qt5-webengine-pipewire-0.3.patch";
    hash = "sha256-mGexRfVDF3yjNzSi9BjavhzPtsXI0BooSr/rZ1z/BDo=";
    stripLen = 1;
    extraPrefix = "src/3rdparty/";
  })
  (fetchpatch2 {
    url = "https://gitlab.archlinux.org/archlinux/packaging/packages/qt5-webengine/-/raw/e8fb4f86104243b90966b69cdfaa967273d834b6/qt5-webengine-ffmpeg7.patch";
    hash = "sha256-YNeHmOVp0M5HB+b91AOxxJxl+ktBtLYVdHlq13F7xtY=";
    stripLen = 1;
    extraPrefix = "src/3rdparty/chromium/";
  })
  (fetchpatch2 {
    url = "https://raw.githubusercontent.com/rubyjs/libv8-node/62476a398d4c9c1a670240a3b070d69544be3761/patch/v8-no-assert-trivially-copyable.patch";
    hash = "sha256-hSTLljmVzYmc3WAVeRq9EPYluXGXFeWVXkykufGQPVw=";
  })
  (fetchpatch2 {
    url = "https://src.fedoraproject.org/rpms/perl-Net-SNMP/raw/6e1d3e8ff2b9bd38dab48301a9d8b5d81ef3b7fe/f/Net-SNMP-v6.0.1-Add_tests_for_another_usm_scenarios.patch";
    hash = "sha256-U7nNuL35l/zdSzx1jgjp1PmLQn3xzzDw9DGnyeydi2E=";
  })
  (fetchpatch2 {
    url = "https://src.fedoraproject.org/rpms/perl-Net-SNMP/raw/6e1d3e8ff2b9bd38dab48301a9d8b5d81ef3b7fe/f/Net-SNMP-v6.0.1-Rewrite_from_Digest-SHA1-to-Digest-SHA.patch";
    hash = "sha256-dznhj1Fcy0iBBl92p825InjkNZixR2MURVQ/b9bVjtc=";
  })
  (fetchpatch2 {
    url = "https://src.fedoraproject.org/rpms/perl-Net-SNMP/raw/6e1d3e8ff2b9bd38dab48301a9d8b5d81ef3b7fe/f/Net-SNMP-v6.0.1-Simple_rewrite_to_Digest-HMAC-helpers.patch";
    hash = "sha256-ZXo9w2YLtPmM1SJLvIiLWefw7SwrTFyTo4eX6DG1yfA=";
  })
  (fetchpatch2 {
    url = "https://src.fedoraproject.org/rpms/perl-Net-SNMP/raw/6e1d3e8ff2b9bd38dab48301a9d8b5d81ef3b7fe/f/Net-SNMP-v6.0.1-Split_usm.t_to_two_parts.patch";
    hash = "sha256-A2gsD6DIX1aFSVLbSL/1zKSM1xiM6hWBadJJH7f5E8o=";
  })
  (fetchpatch2 {
    url = "https://src.fedoraproject.org/rpms/perl-Net-SNMP/raw/6e1d3e8ff2b9bd38dab48301a9d8b5d81ef3b7fe/f/Net-SNMP-v6.0.1-Switch_from_Socket6_to_Socket.patch";
    hash = "sha256-IpVhqI+dXqzauTkLF0Doulg5U33FxHUhqFTp0jeMtMY=";
  })
  (fetchpatch2 {
    # Love 11 support
    url = "https://github.com/SimonLarsen/90-Second-Portraits/commit/0ae7ba046f14cef9857fd6c05d9072455097441f.patch?full_index=true";
    hash = "sha256-/C4gqzwHQqZCuTA/m6WX8mvTxmLxOcHRItVLA3bty3Y=";
  })
  (fetchpatch2 {
    # Migrate to poetry-core build backend
    # https://github.com/mbello/memory-tempfile/pull/13
    name = "poetry-core.patch";
    url = "https://github.com/mbello/memory-tempfile/commit/938a3a3abf01756b1629eca6c69e970021bbc7c0.patch";
    hash = "sha256-q3027MwKXtX09MH7T2UrX19BImK1FJo+YxADfxcdTME=";
  })
  (fetchpatch2 {
    # Python 3.12 support
    name = "jack2-waf2.0.26.patch";
    url = "https://github.com/jackaudio/jack2/commit/250420381b1a6974798939ad7104ab1a4b9a9994.patch";
    hash = "sha256-M/H72lLTeddefqth4BSkEfySZRYMIzLErb7nIgVN0u8=";
  })
  (fetchpatch2 {
    # Replace deprecated failIf with assertFalse for Python 3.12 compatibility.
    url = "https://gitlab.com/warsaw/flufl.bounce/-/commit/e0b9fd0f24572e024a8d0484a3c9fb4542337d18.patch";
    hash = "sha256-HJHEbRVjiiP5Z7W0sQCj6elUMyaWOTqQw6UpYOYCVZM=";
  })
  (fetchpatch2 {
    # TODO: remove when updating to the next release
    # Removes the pyyaml-include~=1.4 dependency
    # https://github.com/dlwh/draccus/issues/46#issuecomment-3180810991
    name = "remove-pyyaml-include-dep.patch";
    url = "https://github.com/dlwh/draccus/commit/3a6db0bc786e46cc13c481bc2235101d7a411441.patch";
    hash = "sha256-0OLUjXJSZ9eIL8dgE8o1Mg0HIMX+4XABSf0tYNFWn8I=";
  })
  (fetchpatch2 {
    # apply chmod to tmpfile, not the outfile, that does not exist at that point
    url = "https://github.com/packethost/prometheus-packet-sd/commit/41977f11b449677497a93456c499916c68e56334.patch";
    hash = "sha256-ffXxbwatKBw7G1fdmsZaT7WX4OmYFMJnueL/kEKc1VE=";
  })
  (fetchpatch2 {
    # cherry-picked from https://github.com/tectonic-typesetting/tectonic/pull/1202
    name = "1202-fix-build-with-rust-1_80-and-icu-75";
    url = "https://github.com/tectonic-typesetting/tectonic/compare/19654bf152d602995da970f6164713953cffc2e6...6b49ca8db40aaca29cb375ce75add3e575558375.patch?full_index=1";
    hash = "sha256-CgQBCFvfYKKXELnR9fMDqmdq97n514CzGJ7EBGpghJc=";
  })
  (fetchpatch2 {
    # fix content-type header case sensitiyivy
    url = "https://github.com/paypal/paypalhttp_python/commit/72609783230663b8e34c6f0384837db7b166c8f4.patch";
    hash = "sha256-K2hO3XRrJ+Gm+rLtWRPy0E2syLS4RhNNHIA3w4xVYtY=";
  })
  (fetchpatch2 {
    # fix racy permissions on outfile
    # https://github.com/packethost/prometheus-packet-sd/issues/15
    url = "https://github.com/packethost/prometheus-packet-sd/commit/bf0ed3a1da4d0f797bd29e4a1857ac65a1d04750.patch";
    hash = "sha256-ZLV9lyqZxpIQ1Cmzy/nY/85b4QWF5Ou0XcdrZXxck2E=";
  })
  (fetchpatch2 {
    # https://github.com/FedoraQt/QAdwaitaDecorations/pull/88
    name = "Fix build with Qt 6.10";
    url = "https://github.com/FedoraQt/QAdwaitaDecorations/commit/e6da80a440218b87e441c8a698014ef3962af98b.patch?full_index=1";
    hash = "sha256-7ZmceoOzUDHvvCX+8SwuX+DIi65d6hYIYfpikMiN0wM=";
  })
  (fetchpatch2 {
    # https://github.com/JnyJny/bitvector/pull/1
    name = "fix-poetry-core.patch";
    url = "https://github.com/JnyJny/bitvector/commit/e5777f2425895ed854e54bed2ed9d993f6feaf2f.patch";
    hash = "sha256-BG3IpDMys88RtkPOd58CWpRWKKzbNe5kV+64hWjtecE=";
  })
  (fetchpatch2 {
    # https://github.com/Novum/vkQuake/pull/809
    url = "https://github.com/Novum/vkQuake/commit/85ddf2386f15944c26317a763d4044077fc8731f.patch?full_index=1";
    hash = "sha256-t+atA+ilCwGwLpql5BZO2OF4Xh1KdzRFjOpglTIA/KY=";
  })
  (fetchpatch2 {
    # https://github.com/OpenAtom-Linyaps/linyaps-web-store-installer/pull/24
    url = "https://github.com/OpenAtom-Linyaps/linyaps-web-store-installer/commit/fc365dd06b17df38d9ae991775e51c5f1b547341.patch?full_index=1";
    hash = "sha256-BpFM3w8njRANvxH34PyP3Y2hLtZWOl18KZxzA+Ew3Zg=";
    includes = [ "CMakeLists.txt" ];
  })
  (fetchpatch2 {
    # https://github.com/XAMPPRocky/tokei/pull/1209
    url = "https://github.com/XAMPPRocky/tokei/commit/ce8d8535276a2e41878981a8199232986ab96c6b.patch";
    hash = "sha256-1tb+WmjVsTxs8Awf1mbKOBIhJ3ddoOT8ZjBKA2BMocg=";
  })
  (fetchpatch2 {
    # https://github.com/enkore/i3pystatus/pull/869
    url = "https://github.com/enkore/i3pystatus/commit/7a39c3527566411eb1b3e4f79191839ac4b0424e.patch";
    hash = "sha256-kSf2Nrypw8CCHC7acDkQXI27178HA3NJlyRWkHyYOGs=";
  })
  (fetchpatch2 {
    # https://github.com/google/gasket-driver/issues/36
    # https://github.com/google/gasket-driver/pull/35
    name = "linux-6.12-compat.patch";
    url = "https://github.com/google/gasket-driver/commit/4b2a1464f3b619daaf0f6c664c954a42c4b7ce00.patch";
    hash = "sha256-UOoOSEnpUMa4QXWVFpGFxBoF5szXaLEfcWtfKatO5XY=";
  })
  (fetchpatch2 {
    # https://github.com/google/gasket-driver/issues/39
    # https://github.com/google/gasket-driver/pull/40
    name = "linux-6.13-compat.patch";
    url = "https://github.com/google/gasket-driver/commit/6fbf8f8f8bcbc0ac9c9bef7a56f495a2c9872652.patch";
    hash = "sha256-roCo0/ETWuDVtZfbpFbrmy/icNI12A/ozOGQNLTtBUs=";
  })
  (fetchpatch2 {
    # https://github.com/kumar303/mohawk/pull/59
    name = "nose-to-pytest.patch";
    url = "https://github.com/kumar303/mohawk/compare/b7899166880e890f01cf2531b5686094ba08df8f...66157c7efbf6b0d18c30a9ffe5dfd84bef27bd3a.patch";
    hash = "sha256-w3sP5XeBqOwoPGsWzYET4djYwuKPaS4OOlC3HBPD0NI=";
  })
  (fetchpatch2 {
    # https://github.com/libretro/same_cdi/pull/19
    name = "Fixes_compilation_errors_as_per_issue_9.patch";
    url = "https://github.com/libretro/same_cdi/commit/bf3212315546cdd514118a4f3ea764fd9c401091.patch?full_index=1";
    hash = "sha256-1vrMxnRtEWUt+6I/4PSfCPDIUAGKkXFd2UVr9473ngo=";
  })
  (fetchpatch2 {
    # https://github.com/meichthys/nextcloud_monitor/pull/10
    url = "https://github.com/meichthys/nextcloud_monitor/commit/cf6191d148e0494de5ae3cbe8fc5ffdba71b6c21.patch";
    hash = "sha256-BSTX5dw+k+ItT6qvpjLiDsH9rW1NmkaBeGO9TlNZZis=";
  })
  (fetchpatch2 {
    # https://github.com/pytest-dev/pytest-forked/actions
    name = "pytest8-compat.patch";
    url = "https://github.com/pytest-dev/pytest-forked/commit/b2742322d39ebda97d5170922520f3bb9c73f614.patch";
    hash = "sha256-tTRW0p3tOotQMtjjJ6RUKdynsAnKRz0RAV8gAUHiNNA=";
  })
  (fetchpatch2 {
    # https://github.com/rhasspy/wyoming-satellite/pull/285
    url = "https://github.com/rhasspy/wyoming-satellite/commit/69465fd56011179cb92e7ce95da2e79fb06a83fb.patch";
    hash = "sha256-njJ8kIVGOpYK6bDeGow3OSNHxKQ9NsUKAR3+lEUH3GE=";
  })
  (fetchpatch2 {
    # https://github.com/rhboot/efibootmgr/issues/186
    name = "efibootmgr_fix-editing-nonfinal-entry.patch";
    url = "https://github.com/rhboot/efibootmgr/commit/3eac27c5fccf93d2d6e634d6fe2a76d06708ec6e.diff?full_index=1";
    hash = "sha256-zXkmfW+BYv8jc/dibu0LEni06KyydVjfW/Lug0i+jUw=";
  })
  (fetchpatch2 {
    # https://github.com/tchellomello/python-amcrest/pull/240
    name = "distutils-str2bool.patch";
    url = "https://github.com/tchellomello/python-amcrest/commit/9cced67d643da6c33d92e85dde22e01b44fb0936.patch";
    hash = "sha256-i9UeYo43Eiwz06KfWyVQUPTLCJLmMjjNcjA7ZQcPIqQ=";
  })
  (fetchpatch2 {
    # https://github.com/tectonic-typesetting/tectonic/pull/1155
    name = "1155-fix-endless-reruns-when-generating-bbl";
    url = "https://github.com/tectonic-typesetting/tectonic/commit/fbb145cd079497b8c88197276f92cb89685b4d54.patch";
    hash = "sha256-6FW5MFkOWnqzYX8Eg5DfmLaEhVWKYVZwodE4SGXHKV0=";
  })
  (fetchpatch2 {
    # https://github.com/xolox/python-humanfriendly/pull/75
    url = "https://github.com/musicinmybrain/python-humanfriendly/commit/13d05b8057010121acd2a402a337ef4ee5834062.patch";
    hash = "sha256-m7cySiIx0gNhh6KKhT71DJFOtFu2Copk9ic2yaiCulk=";
  })
  (fetchpatch2 {
    # https://gitlab.gnome.org/GNOME/gssdp/-/merge_requests/11
    url = "https://gitlab.gnome.org/GNOME/gssdp/-/commit/db9d02c22005be7e5e81b43a3ab777250bd7b27b.diff";
    hash = "sha256-DJQrg6MhzpX8R0QaNnqdwA1+v8xncDU8jcX+I3scW1M=";
  })
  (fetchpatch2 {
    # python 3.12 support; https://github.com/dask/partd/pull/70
    url = "https://github.com/dask/partd/pull/70/commits/c96a034367cb9fee0a0900f758b802aeef8a8a41.patch";
    hash = "sha256-QlSIrFQQQo9We/gf7WSgmWrxdt3rxXQcyvJnFm8R5cM=";
  })
  (fetchpatch2 {
    # python3.13 compat
    url = "https://github.com/Infinidat/munch/commit/84651ee872f9ea6dbaed986fd3818202933a8b50.patch";
    hash = "sha256-n/uBAP7pnlGZcnDuxdMKWgAEdG9gWeGoLWB97T1KloY=";
  })
  (fetchpatch2 {
    # relax cython constraint
    name = "pystemmer-relax-cython.patch";
    url = "https://github.com/snowballstem/pystemmer/commit/d3d423dc877b4f49e0ab1776f7edaff37feb6799.patch";
    hash = "sha256-9K6gy/cLFPfW82XYHVVPXUbQhf8XyB4NUi4YqNtyWcw=";
  })
  (fetchpatch2 {
    # removal of broken pytest-asyncio markers
    url = "https://github.com/crossbario/autobahn-python/commit/7bc85b34e200640ab98a41cfddb38267f39bc92e.patch";
    hash = "sha256-JbuYWQhvjlXuHde8Z3ZSJAyrMOdIcE1GOq+Eh2HTz8c=";
  })
  (fetchpatch2 {
    # remove after next release: "Use PKG_CHECK_MODULES to detect the libxml2 library"
    url = "https://github.com/ldo/dvdauthor/commit/45705ece5ec5d7d6b9ab3e7a68194796a398e855.patch?full_index=1";
    hash = "sha256-tykCr2Axc1qhUvjlGyXQ6X+HwzuFTm5Va2gjGlOlSH0=";
  })
  (fetchpatch2 {
    # remove after next release: "Use pkg-config to find FreeType"
    url = "https://github.com/ldo/dvdauthor/commit/d5bb0bdd542c33214855a7062fcc485f8977934e.patch?full_index=1";
    hash = "sha256-cCj1Wkc6dZvUpjentpK68Q92tb7h+OXwrqdhJ2KYMvU=";
  })
  (fetchpatch2 {
    # remove after next release: "fix to build with GraphicsMagick" (required for subsequent patches to apply)
    url = "https://github.com/ldo/dvdauthor/commit/84d971def13b7e6317eae44369f49fd709b01030.patch?full_index=1";
    hash = "sha256-SWgbaS4cdvrXJ4H5KDM0S46H57rji7CX4Fkfa/RSSPA=";
  })
  (fetchpatch2 {
    # restrict outfile to not be world/group writable
    url = "https://github.com/packethost/prometheus-packet-sd/commit/a0afc2a4c3f49dc234d0d2c4901df25b4110b3ec.patch";
    hash = "sha256-M5133+r77z21/Ulnbz+9sGbbuY5UpU1+22iY464UVAU=";
  })
  (fetchpatch2 {
    # vnc: Allow neatvnc in version 0.9.0
    # https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1649
    url = "https://gitlab.freedesktop.org/wayland/weston/-/commit/b4386289d614f26e89e1c6eb17e048826e925ed1.patch";
    hash = "sha256-mkIOup44C9Kp42tFMXz8Sis4URmPi4t605MQG672nJU=";
  })
  (fetchpatch2 {
    name = "0001-build-fix-build-with-latest-ffmpeg.patch";
    url = "https://chiselapp.com/user/letoram/repository/arcan/vpatch?from=cc6f24de2134282a&to=25bbde5eec7033d3";
    hash = "sha256-i8d/X/xmEGWpO9fG6BerW//JnosPwDolXvMFsuv39IM=";
    stripLen = 1;
    extraPrefix = "src/";
  })
  (fetchpatch2 {
    name = "0001-milkytracker-Build-SET-CMP0004-OLD-only-if-CMake-lt-4.0.patch";
    url = "https://github.com/milkytracker/MilkyTracker/commit/517b27faf6e1471c2ccb25c3c22f78eb862cd552.patch?full_index=1";
    hash = "sha256-/+Orf6BKZxhe90VT7p0gdJtHDHLrJy+rmPt03ma410s=";
  })
  (fetchpatch2 {
    name = "46aebb0-Address-incompatible-pointer-errors.patch";
    url = "https://github.com/amazon-ion/ion-c/commit/46aebb0b650a4cf61425ef1a8e78e2443023e853.patch?full_index=1";
    hash = "sha256-5qzSbZV9Oe5soJzkyCtVtWejedLEjAz7yuVotATPmbs=";
    stripLen = 1;
    extraPrefix = "ion-c/";
  })
  (fetchpatch2 {
    name = "Bump-CMake-minimum-version-to-3.5";
    url = "https://github.com/liballeg/allegro5/commit/6e93fcaabaafd81701f4cd1b74f4b69dd598bc9b.patch?full_index=1";
    hash = "sha256-IEnn66bS2m6MVFCNf341yLtd7jTl2gflL5EFJFmbEt4=";
  })
  (fetchpatch2 {
    name = "CVE-2025-30472.patch";
    url = "https://github.com/corosync/corosync/commit/7839990f9cdf34e55435ed90109e82709032466a.patch??full_index=1";
    hash = "sha256-EgGTfOM9chjLnb1QWNGp6IQQKQGdetNkztdddXlN/uo=";
  })
  (fetchpatch2 {
    name = "EmuThread-align_with_co_create()_and_pthread_create().patch";
    url = "https://github.com/libretro/mupen64plus-libretro-nx/commit/26dfd670ffdd5ed6a03e6704dc73f82c13d81dd9.patch?full_index=1";
    hash = "sha256-BraCR/b8DTmVAWrUxiXp9nxBYvTpTW9OQAt8TP1eusI=";
  })
  (fetchpatch2 {
    name = "Fix_compilation_of_bundled_libzlib.patch";
    url = "https://github.com/libretro/mupen64plus-libretro-nx/commit/3c3e7fbc70b8f533c09c964cf468ba5e8d61351c.patch?full_index=1";
    hash = "sha256-PCJLNYhhccnWLcnPaHL6tz+5qdjogJRYfzZIh3r+Vlk=";
  })
  (fetchpatch2 {
    name = "Increase-cmake_minimum_required-to-3.5";
    url = "https://github.com/docopt/docopt.cpp/commit/05d507da0d153faff381f44968833ebffdc03447.patch?full_index=1";
    hash = "sha256-bwKkhU3+GZFIUH0Ig0l9zcTtox9som3DY+ZApWrWl80=";
  })
  (fetchpatch2 {
    name = "add-ability-to-build-with-system-installed-jsoncpp.patch";
    url = "https://github.com/ValveSoftware/openvr/commit/54a58e479f4d63e62e9118637cd92a2013a4fb95.patch";
    hash = "sha256-aMojjbNjLvsGev0JaBx5sWuMv01sy2tG/S++I1NUi7U=";
  })
  (fetchpatch2 {
    name = "add-missing-build-system.patch";
    url = "https://github.com/dermotduffy/hass-web-proxy-lib/commit/0eed7a57f503fc552948a45e7f490ddaff711896.patch";
    hash = "sha256-ccOdhA0NhlTmdA51sNdB357Xh13E4PsLlvUTU4GQ9jk=";
  })
  (fetchpatch2 {
    name = "alsa-ucm-Check-UCM-verb-before-working-with-device-status.patch";
    url = "https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/commit/f5cacd94abcc47003bd88ad7ca1450de649ffb15.patch";
    hash = "sha256-WyEqCitrqic2n5nNHeVS10vvGy5IzwObPPXftZKy/A8=";
  })
  (fetchpatch2 {
    name = "alsa-ucm-Replace-port-device-UCM-context-assertion-with-an-error.patch";
    url = "https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/commit/ed3d4f0837f670e5e5afb1afa5bcfc8ff05d3407.patch";
    hash = "sha256-fMJ3EYq56sHx+zTrG6osvI/QgnhqLvWiifZxrRLMvns=";
  })
  (fetchpatch2 {
    name = "apache-httpd-cross-compile.patch";
    url = "https://gitlab.com/buildroot.org/buildroot/-/raw/5dae8cddeecf16c791f3c138542ec51c4e627d75/package/apache/0001-cross-compile.patch";
    hash = "sha256-KGnAa6euOt6dkZQwURyVITcfqTkDkSR8zpE97DywUUw=";
  })
  (fetchpatch2 {
    name = "beancount-workaround.patch";
    url = "https://github.com/beancount/beanquery/commit/aa0776285a25baeedf151e9f582bef0314f76004.patch?full_index=1";
    hash = "sha256-hWL1CDsBSbMqufEQrtEncmyUr5L5VJI+i4xQtnAvQd8=";
  })
  (fetchpatch2 {
    name = "blob-tree-add-hash.patch";
    url = "https://github.com/just-buildsystem/justbuild/commit/c54a46de7df0c6b26b7d8f4a10d380103da634fb.patch?full_index=1";
    hash = "sha256-hAi4YJmNAwfSl2SWjVCWBhk7VbQeNN1JhmHS9dy2GdU=";
  })
  (fetchpatch2 {
    name = "blockfrost-python-fix-version";
    url = "https://github.com/blockfrost/blockfrost-python/commit/02fdc67ff6d1333c0855e740114585852bbfa0bc.patch?full_index=1";
    hash = "sha256-070tnWxOnVNsCYXmBFo39JUgQDqphdpqx3A9OIuC94U=";
  })
  (fetchpatch2 {
    name = "ceph-boost-1.86-uuid.patch";
    url = "https://github.com/ceph/ceph/commit/01306208eac492ee0e67bff143fc32d0551a2a6f.patch?full_index=1";
    hash = "sha256-OnDrr72inzGXXYxPFQevsRZImSvI0uuqFHqtFU2dPQE=";
  })
  (fetchpatch2 {
    name = "ceph-cmake-4.patch";
    url = "https://gitlab.alpinelinux.org/ashpool/aports/-/raw/d22b70eafe33c3daabe4eea6913c5be87d9463ad/community/ceph19/cpp_redis.patch";
    hash = "sha256-wxPIsYt25CjXhJ6kmr/MXwFD58Sl4y4W+r9jAMND+uw=";
  })
  (fetchpatch2 {
    name = "ceph-systemd-prefix.patch";
    url = "https://github.com/ceph/ceph/commit/9b38df488d7101b02afa834ea518fd52076d582a.patch?full_index=1";
    hash = "sha256-VcbJhCGTUdNISBd6P96Mm5M3fFVmZ8r7pMl+srQmnIQ=";
  })
  (fetchpatch2 {
    name = "ceph-systemd-sans-cluster-name.patch";
    url = "https://github.com/ceph/ceph/commit/5659920c7c128cb8d9552580dbe23dd167a56c31.patch?full_index=1";
    hash = "sha256-Uch8ZghyTowUvSq0p/RxiVpdG1Yqlww9inpVksO6zyk=";
  })
  (fetchpatch2 {
    name = "cmake-4.patch";
    url = "https://github.com/rodlie/cyan/commit/885e81310de8df7f32a5e1d2c722f89bcd969cd1.patch?full_index=1";
    hash = "sha256-5VhXKamDNGeEvi86l+R3Lvzb4G5JFBq2dqqd6TdyxZ4=";
  })
  (fetchpatch2 {
    name = "cmake-cxx-standard-17.patch";
    url = "https://github.com/darlinghq/darling-dmg/pull/105/commits/b7c620f76a5f76748b3d14dd2a58e77f8b6ed0c0.patch";
    hash = "sha256-i1lisEiwYm4IxgKmBYnjscvW6ObT7XGLVbjW2i5yXV4=";
  })
  (fetchpatch2 {
    name = "cmake-fix.patch";
    url = "https://github.com/apache/arrow/commit/48c0bbbd4a2eedcca518caeb7f7547c7988dc740.patch?full_index=1";
    hash = "sha256-i/vZy/61VYP+mo1AxfoiBSjTip04vhFOh3hGjHCJy6g=";
    stripLen = 1; # applying patch from within `cpp/` subdirectory
  })
  (fetchpatch2 {
    name = "cmake-target-guard-fix.patch";
    url = "https://github.com/ornladios/ADIOS2/commit/23fd08a10b52a971150f93f99d341b83b8096e3d.patch?full_index=1";
    hash = "sha256-+29a9JgiCv2kBz0uUT8Kn/Tf3KDD1JNPdzeb/DruTBo=";
  })
  (fetchpatch2 {
    name = "cmake-update.patch";
    url = "https://github.com/pothosware/SoapyRTLSDR/commit/448c9d0d326c2600905b7ce84222ff9d72ba2189.patch?full_index=1";
    hash = "sha256-hWlNowkf9yZM6p+EGh+IiUm2JfG5mLe8Qq8gTVIdIak=";
  })
  (fetchpatch2 {
    name = "cpp-version.patch";
    url = "https://github.com/alex-courtis/xlayoutdisplay/commit/56983b45070edde78cc816d9cff4111315e94a7a.patch";
    hash = "sha256-zd28Nkw8Kmm20zGT6wvdBHcHfE4p+RFotUO9zJwPQMc=";
  })
  (fetchpatch2 {
    name = "cstdint.patch";
    url = "https://git.alpinelinux.org/aports/plain/community/maplibre-gl-native/cstdint.patch?id=ae8edc6b02df388ef37a69c12a5df25dd8550238";
    hash = "sha256-o7wT/rk5vgwxEutAyIEAxwfKNxCoBtkhVcLjc7uTsYc=";
  })
  (fetchpatch2 {
    name = "cython-3.patch";
    url = "https://github.com/capnproto/pycapnp/pull/334.diff?full_index=1";
    hash = "sha256-we7v4RaL7c1tePWl+oYfzMHAfnvnpdMkQgVu9YLwC6Y=";
  })
  (fetchpatch2 {
    name = "distutils-deprecated.patch";
    url = "https://github.com/PhracturedBlue/asterisk_mbox/commit/bab84525306a0c41aadd3aab4ebba7c062253d07.patch";
    hash = "sha256-2j7jIl3Ydn2dHJhEzu/77Zkxhw58NIebgULifpTVidY=";
  })
  (fetchpatch2 {
    name = "doctest-absolute-path.patch";
    url = "https://github.com/sagemath/sage/commit/3de32dccd2e32e5452ca3adf5bd63cbacb64ba9d.patch?full_index=1";
    hash = "sha256-rp+9d8Y6kifWzufE07GWU68txPn//w7uMn4LcpITaBs=";
  })
  (fetchpatch2 {
    name = "dont-fail-with-python-313.patch";
    url = "https://github.com/jazzband/geojson/commit/c13afff339e6b78f442785cc95f0eb66ddab3e7b.patch?full_index=1";
    hash = "sha256-xdz96vzTA+zblJtCvXIZe5p51xJGM5eB/HAtCXgy5JA=";
  })
  (fetchpatch2 {
    name = "eq-to-assert.patch";
    url = "https://github.com/halfak/python-jsonable/pull/2/commits/335e61bb4926e644aef983f7313793bf506d2463.patch";
    hash = "sha256-tCVA0wG+UMyB6oaNf4nbZ2BPWkNumaGPcjP5VJKegBo=";
  })
  (fetchpatch2 {
    name = "fix-async-in-test.patch";
    excludes = [ ".github/workflows/code-style.yml" ];
    url = "https://github.com/hydrogram/hydrogram/commit/7431319a1d990aa838012bd566a9746da7df2a6e.patch";
    hash = "sha256-MPv13cxnNPDD+p9EPjDPFqydGy57oXzLeRxL3lG8JKU=";
  })
  (fetchpatch2 {
    name = "fix-build-with-qt-610-invalidateFilter-deprecated.patch";
    url = "https://github.com/nullobsi/cantata/pull/90.patch";
    hash = "sha256-dMxbC/p5mD/TQZEXORbvNON7Zzbvq0khaIR89lU5cO4=";
  })
  (fetchpatch2 {
    name = "fix-build-with-qt-610-qfile-open.patch";
    url = "https://github.com/nullobsi/cantata/pull/89.patch";
    hash = "sha256-c7hdecX2oo9jTlLc6zd7LVjgZj4w89zN+eEw7ol/hmI=";
  })
  (fetchpatch2 {
    name = "fix-charset-cmakelists.patch";
    url = "https://git.tartarus.org/?p=simon/halibut.git;a=blobdiff_plain;f=charset/CMakeLists.txt;h=4613cb4d02959db051dd82b25d6bfd82a50455d7;hp=06eae7703d3e52aa50d5309624ec93a7684f73d8;hb=570407a40bdde2a9bb50c16aa47711202ade8923;hpb=ce14e373b7e6532c0dfa1908fe6030c5667cf79a";
    hash = "sha256-YdLxbXc3C2UxWp0CUzvmJ8mgzqaWJ5Br4VfRU7YjBYE=";
  })
  (fetchpatch2 {
    name = "fix-cmake4-build.patch";
    url = "https://github.com/pothosware/SoapyRTLSDR/commit/bb2d1511b957138051764c9193a3d6971e912b85.patch?full_index=1";
    hash = "sha256-C90B5WMjx1lJKiX0F/cAfGmz2WRc2BA84FTmVmnC+DI=";
  })
  (fetchpatch2 {
    name = "fix-compilation-for-cython-3.1.2";
    url = "https://github.com/gesellkammer/pyliblo3/commit/baa249acf91bcb851aa4e30e53e88728fe0fb0c9.patch?full_index=1";
    hash = "sha256-fMKBVIZLBq62khhX40tpaM47nuHB0eqiURIul/4LMig=";
  })
  (fetchpatch2 {
    name = "fix-cve-2024-28820";
    url = "https://patch-diff.githubusercontent.com/raw/threerings/openvpn-auth-ldap/pull/92.patch";
    hash = "sha256-SXuo1D/WywKO5hCsmoeDdTsR7EelxFxJAKmlAQJ6vuE=";
  })
  (fetchpatch2 {
    name = "fix-missing-zope-skip.patch";
    url = "https://github.com/miracle2k/webassets/commit/3bfb5ea8223c46c60b922fdbbda36d9b8c5e9c9c.patch?full_index=1";
    hash = "sha256-dV8bp6vYr56mZpzw5C7ac4rXri04o4MrAhwfWUXLe4s=";
  })
  (fetchpatch2 {
    name = "fix-oboete-justfile.patch";
    url = "https://patch-diff.githubusercontent.com/raw/mariinkys/oboete/pull/25.diff?full_index=1";
    hash = "sha256-GPrtL73EKQi5fIIWPYcuS3HRwJ4ZHFsHzRYN6pYuUVg=";
  })
  (fetchpatch2 {
    name = "fix-pillow-12-compat";
    url = "https://github.com/tensorflow/datasets/pull/11149/commits/21062d65b33978f2263443280c03413add5c0224.patch";
    hash = "sha256-GWb+1E5lQNhFVp57sqjp+WqzZSva1AGpXe9fbvXXeIA=";
  })
  (fetchpatch2 {
    name = "fix-qt6.9-compatibility.patch";
    url = "https://github.com/PrismLauncher/PrismLauncher/commit/8bb9b168fb996df9209e1e34be854235eda3d42a.diff";
    hash = "sha256-hOqWBrUrVUhMir2cfc10gu1i8prdNxefTyr7lH6KA2c=";
  })
  (fetchpatch2 {
    name = "fix-rust-1.91-tests.patch";
    url = "https://github.com/rust-lang/mdBook/commit/841c68d05e763b031524a2b4d679f033cd15e64c.patch?full_index=1";
    hash = "sha256-KDQhmFX2TWamtdyssFL69MP3vg9LABb+bF8/7vaFsew=";
  })
  (fetchpatch2 {
    name = "fix-support-new-click-in-papisrunner.patch";
    url = "https://github.com/papis/papis/commit/0e3ffff4bd1b62cdf0a9fdc7f54d6a2e2ab90082.patch?full_index=1";
    hash = "sha256-KUw5U5izTTWqXHzGWLibtqHWAsVxla6SA8x6SJ07/zU=";
  })
  (fetchpatch2 {
    name = "fix-tests.patch";
    url = "https://repo.mercurial-scm.org/python-hglib/raw-rev/a2afbf236ca86287e72f54e1248413625d1bc405";
    hash = "sha256-T/yKJ8cMMOBVk24SXwyPOoD321S1fZEIunaPJAxI0KI=";
  })
  (fetchpatch2 {
    name = "fix-to_bytes-tests.patch";
    url = "https://github.com/aleaxit/gmpy/commit/1903841667e7a6842bdead90bd7798b99de5b7be.patch?full_index=1";
    hash = "sha256-rlssUIkQ1RCRSu5eCXKJ2lNa/oIoLzf9sxJuNfDrVmk=";
  })
  (fetchpatch2 {
    name = "fix-version-check";
    url = "https://github.com/laishulu/macism/commit/928f6f55e9cdaaf39ae5fe7ce7f803d608c68565.patch?full_index=1";
    hash = "sha256-9rh1bxpYMOKNumAthZBNluJbbH5HLI9PfM6hGzxGpjU=";
  })
  (fetchpatch2 {
    name = "fix-version-string.patch";
    url = "https://github.com/vgmtrans/vgmtrans/commit/5ad8a60a19476d2ae9a7c409b83ab6d5e1ff827f.patch?full_index=1";
    hash = "sha256-I5ykYzj3tUBQ2e3TAnCm5Ry1Hmmi2IVneFQCe5/JV/A=";
  })
  (fetchpatch2 {
    name = "fix-version.patch";
    url = "https://github.com/Yamashou/gqlgenc/commit/aad0599a70780696a9530a7adffebfff53538695.patch?full_index=1";
    hash = "sha256-moidhkkO/5It8kH1VlwbV+YLlMOTXKH3RyLKGCA2chw=";
  })
  (fetchpatch2 {
    name = "fix_view_operator.patch";
    url = "https://aur.archlinux.org/cgit/aur.git/plain/fix_view_operator.patch?h=openmsx&id=aa63ce478c7f528d60b79bcf4c9427101caa3b94";
    hash = "sha256-3wmUJQrM5P3zfFJt+HF32AchNSqCgFTnQ508Bztg4uA=";
  })
  (fetchpatch2 {
    name = "fno-common.patch";
    url = "https://github.com/galculator/galculator/commit/501a9e3feeb2e56889c0ff98ab6d0ab20348ccd6.patch";
    hash = "sha256-qVJHcfJTtl0hK8pzSp6MjhYAh1NbIIWr3rBDodIYBvk=";
  })
  (fetchpatch2 {
    name = "gap-4.15.1-update.patch";
    url = "https://github.com/sagemath/sage/commit/54d4ddb132cc71ef26b4db1f48afd6736d41cc63.patch?full_index=1";
    hash = "sha256-PZyOXRsgcsPvgceGGZXet5URJgWiIlCfFx8tvwpLk5A=";
    excludes = [ "src/doc/zh/constructions/rep_theory.rst" ];
  })
  (fetchpatch2 {
    name = "gnatcoll-core-gnat-12.patch";
    url = "https://github.com/AdaCore/gnatcoll-core/commit/515db1c9f1eea8095f2d9ff9570159a78c981ec6.patch";
    sha256 = "1ghnkhp5fncb7qcmf59kyqvy0sd0pzf1phnr2z7b4ljwlkbmcp36";
  })
  (fetchpatch2 {
    name = "googletest-cmake-fix.patch";
    url = "https://github.com/ornladios/ADIOS2/commit/20aab0f99d38dc4437b086edf6b44ecf4100ed76.patch?full_index=1";
    hash = "sha256-CZD3QUATX0JI75Oip0LNwirWIwgQakWuCHs1fIjwzj0=";
  })
  (fetchpatch2 {
    name = "gtk-4.20-fix.patch";
    url = "https://github.com/ErikReider/SwaySettings/commit/e4f3749a053b5fbe0feab93e46d6eba380ee2e58.patch?full_index=1";
    hash = "sha256-3A0VPAUQ3UjQ2mqR24z5CQ5Tdjw73UzfPz5UUcl/FDA=";
  })
  (fetchpatch2 {
    name = "html2text-2024.2.25-compat.patch";
    url = "https://github.com/rss2email/rss2email/commit/b5c0e78006c2db6929b5ff50e8529de58a00412a.patch";
    hash = "sha256-edmsi3I0acx5iF9xoAS9deSexqW2UtWZR/L7CgeZs/M=";
  })
  (fetchpatch2 {
    name = "libportal-fix-qt6.9-private-api-usage.patch";
    url = "https://github.com/flatpak/libportal/commit/796053d2eebe4532aad6bd3fd80cdf3b197806ec.patch?full_index=1";
    hash = "sha256-TPIKKnZCcp/bmmsaNlDxAsKLTBe6BKPCTOutLjXPCHQ=";
  })
  (fetchpatch2 {
    name = "libxml2-2.11-fix.patch";
    url = "https://gitlab.gnome.org/GNOME/gupnp/-/commit/bc56f02b0f89e96f2bd74af811903d9931965f58.patch";
    hash = "sha256-KCHlq7Es+WLIWKgIgGVTaHarVQIiZPEi5r6nMAhXTgY=";
  })
  (fetchpatch2 {
    name = "matplotlib_3_10-compatibility.patch";
    url = "https://github.com/mwaskom/seaborn/commit/385e54676ca16d0132434bc9df6bc41ea8b2a0d4.patch";
    hash = "sha256-nwGwTkP7W9QzgbbAVdb2rASgsMxqFnylMk8GnTE445w=";
  })
  (fetchpatch2 {
    name = "meson-1.2-fix.patch";
    url = "https://gitlab.gnome.org/GNOME/gupnp/-/commit/85c0244cfbf933d3e90d50ab68394c68d86f9ed5.patch";
    hash = "sha256-poDhkEgDTpgGnTbbZLPwx8Alf0h81vmzJyx3izWmDGw=";
  })
  (fetchpatch2 {
    name = "migrate-to-pytest.patch";
    url = "https://github.com/blockdiag/blockdiag/commit/4f4f726252084f17ecc6c524592222af09d37da4.patch";
    hash = "sha256-OkfKJwJtb2DJRXE/8thYnisTFwcfstUFTTJHdM/qBzg=";
  })
  (fetchpatch2 {
    name = "minizip-avoid_trying_to_compile_problematic_code.patch";
    url = "https://github.com/libretro/mupen64plus-libretro-nx/commit/2b05477dd9cd99e7f9425f58cb544f454fc0d813.patch?full_index=1";
    hash = "sha256-Q0yymeS6taeFRt6BH6IX5q1SDUMh2Zn3mFpdJguyk9M=";
  })
  (fetchpatch2 {
    name = "nose-to-pytest.patch";
    url = "https://github.com/mediawiki-utilities/python-mwtypes/commit/58d7f59e4927aaa6278f84576794df713c673058.patch";
    hash = "sha256-jh1uEqqhIK2DyNvVN0XYGM7BXTmypnoC4VoB0V+9JmE=";
  })
  (fetchpatch2 {
    name = "nose-to-pytest.patch";
    url = "https://github.com/pyexcel/pyexcel-ods/compare/661d4f0b484ed281128c72e1a2701e2d33fc1879...838b410e800a86c147644568aaa8b2c005d13491.patch";
    hash = "sha256-1a52VM8yGDEjSFXTq3Di74xwv10d/QskpctOnz9zW1w=";
  })
  (fetchpatch2 {
    name = "numpy-v2-compat.patch";
    url = "https://github.com/portugueslab/flammkuchen/commit/c523ea78e10facd98d4893f045249c68bae17940.patch?full_index=1";
    hash = "sha256-/goNkiEBrcprywQYf2oKvGbu5j12hmalPuB45wNNt+I=";
  })
  (fetchpatch2 {
    name = "numpy2-compat.patch";
    url = "https://github.com/asteroid-team/asteroid-filterbanks/commit/2c22e97c782f0e57e49d2beb56054c71ad5ccb08.patch";
    hash = "sha256-wBwQJzG/ET+XbV39l3UvctwhR/5TG+WgdxrPa/nyhRU=";
  })
  (fetchpatch2 {
    name = "numpy_2-compatibility.patch";
    url = "https://github.com/mwaskom/seaborn/commit/58f170fe799ef496adae19925d7d4f0f14f8da95.patch";
    hash = "sha256-/a3G+kNIRv8Oa4a0jPGnL2Wvx/9umMoiq1BXcXpehAg=";
  })
  (fetchpatch2 {
    name = "optparse-applicative-0.18.1-allow-QuickCheck-2.15.patch";
    url = "https://github.com/pcapriotti/optparse-applicative/commit/2c2a39ed53e6339d8dc717efeb7d44f4c2b69cab.patch";
    hash = "sha256-198TfBUR3ygPpvKPvtH69UmbMmoRagmzr9UURPr6Kj4=";
  })
  (fetchpatch2 {
    name = "parameterized-docstring-3.13-compat.patch";
    url = "https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-python/parameterized/files/parameterized-0.9.0-py313-test.patch?id=dec60bb6900d6ebdaaa6aa1dcb845b30b739f9b5";
    hash = "sha256-tWcN0eRC0oRHrOaa/cctXLhi1WapDKvxO36e6gU6UIk=";
  })
  (fetchpatch2 {
    name = "pr191-add-option-to-use-custom-espeak-data-path.patch";
    url = "https://github.com/bootphon/phonemizer/commit/cc1db4bfaf688fdfb8275fd83d218f06411455e6.patch?full_index=1";
    hash = "sha256-PMeX7A9BBVLS3Sk/Lum85GpJzKXM5tULTWSURq3MD8E=";
  })
  (fetchpatch2 {
    name = "pr82-remove-pip-dependency.patch";
    url = "https://github.com/hexgrad/misaki/commit/7d2fdff9fe046dd52b638bbb1b243fb789f4cb31.patch?full_index=1";
    hash = "sha256-N796YWrGe51FYVdxbQ8omJxeGdvOAiKEUKhhm10TQO8=";
  })
  (fetchpatch2 {
    name = "protobuf-30-compat.patch";
    url = "https://github.com/apache/arrow/pull/46136.patch";
    hash = "sha256-WTpe/eT3himlCHN/R78w1sF0HG859mE2ZN70U+9N8Ag=";
    stripLen = 1;
  })
  (fetchpatch2 {
    name = "pygment-2_19-compatibility.patch";
    url = "https://github.com/pypa/readme_renderer/commit/04d5cfe76850192364eff344be7fe27730af8484.patch";
    hash = "sha256-QBU3zL3DB8gYYwtKrIC8+H8798pU9Sz3T9e/Q/dXksw=";
  })
  (fetchpatch2 {
    name = "python-3.13-compat.patch";
    url = "https://github.com/Pylons/pyramid/commit/1079613eb07e2a67454378e1fc28815dfd64bb82.patch";
    hash = "sha256-/jxbA2q0kAeXDvIwhNkO8h4KbKtdquWXAH7/0lV8MXc=";
  })
  (fetchpatch2 {
    name = "python3-for-tests";
    url = "https://github.com/docopt/docopt.cpp/commit/b3d909dc952ab102a4ad5a1541a41736f35b92ba.patch?full_index=1";
    hash = "sha256-LXnN36/JuHsCeLnjuPFa42dT52iOcnJd4NGYx96Z5c0=";
  })
  (fetchpatch2 {
    name = "python312-compat.patch";
    url = "https://github.com/PyCQA/pydocstyle/commit/306c7c8f2d863bdc098a65d2dadbd4703b9b16d5.patch";
    hash = "sha256-bqnoLz1owzDpFqlZn8z4Z+RzKCYBsI0PqqeOtjLxnMo=";
  })
  (fetchpatch2 {
    name = "python313-compat.patch";
    url = "https://github.com/xolox/python-coloredlogs/commit/9d4f4020897fcf48d381de8e099dc29b53fc9531.patch?full_index=1";
    hash = "sha256-Z7MYzyoQBMLBS7c0r5zITuHpl5yn4Vg7Xf/CiG7jTSs=";
  })
  (fetchpatch2 {
    name = "refactor-with-pytest.patch";
    url = "https://github.com/miracle2k/flask-assets/commit/56e06dbb160c165e0289ac97496354786fe3f3fd.patch?full_index=1";
    hash = "sha256-Feo7gHHmHtWRB+3XvlECdU4i5rpyjyKEYEUCuy24rf4=";
  })
  (fetchpatch2 {
    name = "regenerate-package-lock.patch";
    url = "https://github.com/http-party/http-server/commit/0cbd85175f1a399c4d13c88a25c5483a9f1dea08.patch";
    hash = "sha256-hJyiUKZfuSaXTsjFi4ojdaE3rPHgo+N8k5Hqete+zqk=";
  })
  (fetchpatch2 {
    name = "remove-distutils.patch";
    url = "https://github.com/datamllab/rlcard/commit/e44378157aaf229ffe2aaef9fafe500c2844045e.patch";
    hash = "sha256-aQS4d9ETj6pDv26G77mC+0xHQMA2hjspAxtAyz0rA6Y=";
  })
  (fetchpatch2 {
    name = "remove-nose-and-mock.patch";
    url = "https://github.com/miracle2k/webassets/commit/26e203929eebbb4cdbb9967cf47fefa95df8f24d.patch?full_index=1";
    hash = "sha256-+jrMT6Sl/MOLkleUEDZkzRd5tzBTXZYNoCXRrTFVtq4=";
    excludes = [
      "requirements-dev.pip"
      "tox.ini"
    ];
  })
  (fetchpatch2 {
    name = "remove-nose.patch";
    excludes = [ "heptapod-ci.yml" ];
    url = "https://repo.mercurial-scm.org/python-hglib/raw-rev/8341f2494b3fc1c0d9ee55fa4487c0ac82f64d2a";
    hash = "sha256-4gicVCAH94itxHY0l8ek0L/RVhUrw2lMbbnENbWrV6U=";
  })
  (fetchpatch2 {
    name = "remove-usage-of-deprecated-ida-simple-xx-api.patch";
    url = "https://github.com/medusalix/xpad-noone/commit/e0f6ad5f2fabd5f8e74796a87154c92c8e9b6068.patch";
    hash = "sha256-7Ye/rd51RpzThgts8R5RT0CRVvx5bKmy5i0KPidic30=";
  })
  (fetchpatch2 {
    name = "rename-python-levenshtein-to-levenshtein";
    url = "https://github.com/funstory-ai/BabelDOC/pull/542.patch?full_index=1";
    hash = "sha256-rjXhKVFivkJo54WdYiihqB3lrlu4YEwVZZkE4WBatWs=";
  })
  (fetchpatch2 {
    name = "replace-nose-with-pytest.patch";
    url = "https://github.com/kipe/enocean/commit/e5ca3b70f0920f129219c980ad549d7f3a4576de.patch";
    hash = "sha256-cDBvI0I4W5YkGTpg+rKy08TUAmKlhKa/5+Muou9iArs=";
  })
  (fetchpatch2 {
    name = "rshim-fix-bfb-install.patch";
    url = "https://github.com/Mellanox/rshim-user-space/commit/0b2b17eeb04d80b7efb20aa2a9dc24759680aaea.patch";
    hash = "sha256-JqnCGWM6Wjg+WFQhqHv6h4VbawyCf75L4wfd7L+n7po=";
  })
  (fetchpatch2 {
    name = "setuptools-75.0-compat.patch";
    url = "https://github.com/scikit-build/scikit-build/commit/3992485c67331097553ec8f54233c4c295943f70.patch";
    hash = "sha256-U34UY+m6RE3c3UN/jGHuR+sRUqTGmG7dT52NWCY7nIE=";
  })
  (fetchpatch2 {
    name = "sofia-sip-fix-incompatible-pointer-type.patch";
    url = "https://github.com/freeswitch/sofia-sip/commit/46b02f0655af0a9594e805f09a8ee99278f84777.patch?full_index=1";
    hash = "sha256-bZzjg7GBxR2wSlPH81krZRCK43OirGLWH/lrLRZ0L0k=";
  })
  (fetchpatch2 {
    name = "specify-build-system.patch";
    url = "https://github.com/jkeljo/sisyphus-control/commit/dd48079e03a53cdb3af721de0d307209286c38f0.patch";
    hash = "sha256-573YLPrNbbMXSrZ3gK8cmHmuk2+UeggcKL/+eo4pgrs=";
  })
  (fetchpatch2 {
    name = "tomlplusplus-install-example-programs.patch";
    url = "https://github.com/marzer/tomlplusplus/commit/8128eb632325d1820f4d17dd8250dcda6ab07743.patch";
    hash = "sha256-7m2P+e1/OASHrzm9LSy6RnayS/kGxFC82xOyGBGXeG0=";
  })
  (fetchpatch2 {
    name = "treat-zero-width-constant-as-zero.patch";
    url = "https://github.com/YosysHQ/yosys/commit/478b6a2b3fbab0fd4097b841914cbe8bb9f67268.patch";
    hash = "sha256-KeLoZfkXMk2KIPN9XBQdqWqohywQONlWUIvrGwgphKs=";
  })
  (fetchpatch2 {
    name = "use-compliant-license-schema.patch";
    url = "https://github.com/tarasglek/github-to-sops/commit/798c864f1537f668fbaf7802651ec8beb998a7af.patch?full_index=1";
    hash = "sha256-udBO5dN8RCclXpkTj/gU6zcUcaoM+G9jPEw4dCZ+oT4=";
  })
  (fetchpatch2 {
    name = "use-correct-CPP11-definition-for-vsprintf_s.patch";
    url = "https://github.com/ValveSoftware/openvr/commit/0fa21ba17748efcca1816536e27bdca70141b074.patch";
    hash = "sha256-0sPNDx5qKqCzN35FfArbgJ0cTztQp+SMLsXICxneLx4=";
  })
  (fetchpatch2 {
    name = "use-go-mod-and-remove-vendor-dirs";
    url = "https://github.com/IzakMarais/reporter/commit/e844b3f624e0da3a960f98cade427fe54f595504.patch";
    hash = "sha256-CdI7/mkYG6t6H6ydGu7atwk18DpagdP7uzfrZVKKlhA=";
  })
  (fetchpatch2 {
    name = "use-pnpm-8.patch";
    url = "https://github.com/open-cli-tools/concurrently/commit/0b67a1a5a335396340f4347886fb9d0968a57555.patch";
    hash = "sha256-mxid2Yl9S6+mpN7OLUCrJ1vS0bQ/UwNiGJ0DL6Zn//Q=";
  })
  (fetchpatch2 {
    name = "use-poetry-core.patch";
    url = "https://github.com/rss2email/rss2email/commit/183a17aefe4eb66f898cf088519b1e845559f2bd.patch";
    hash = "sha256-SoWahlOJ7KkaHMwOrKIBgwEz8zJQrSXVD1w2wiV1phE=";
  })
  (fetchpatch2 {
    name = "uv-build.patch";
    url = "https://github.com/Prince213/marimo/commit/b1c690e82e8117c451a74fdf172eb51a4861853d.patch?full_index=1";
    hash = "sha256-iFS5NSGjaGdECRk0LCRSA8XzRb1/sVSZCTRLy6taHNU=";
  })
  (fetchpatch2 {
    name = "uv-build.patch";
    url = "https://github.com/Prince213/sigstore-models/commit/0cbd46ce7ebc8a5d2825b8fc98147a9ba4b3be70.patch?full_index=1";
    hash = "sha256-6DLhhHkGW2Ok9xwKx6YT5BkCqQNH/Ja/KEO9FHl4NXo=";
  })
  (fetchpatch2 {
    name = "uv-build.patch";
    url = "https://github.com/matejcik/construct-classes/commit/d1ecacc0cf5cb332ffe6ed85ce9dfc552f77231f.patch?full_index=1";
    hash = "sha256-VeifL8bER0mIRNXKTA+/cje8AxWJKg/q8ipmf3gTeiw=";
  })
  (fetchpatch2 {
    name = "uv-build.patch";
    url = "https://github.com/pyca/cryptography/commit/5f311c1cbe09ddea6136b0bb737fb7df6df1b923.patch?full_index=1";
    stripLen = 1;
    includes = [ "pyproject.toml" ];
    hash = "sha256-OdHK0OGrvOi3mS0q+v8keDLvKxtgQkDkHQSYnmC/vd4=";
  })
  (fetchpatch2 {
    name = "uv-build.patch";
    url = "https://github.com/yanyongyu/githubkit/commit/2817664d904541242d4cedf7aae85cd4c4b606e2.patch?full_index=1";
    hash = "sha256-mmtjlebHZpHX457frSOe88tsUo7iNdSIUynGZjcjuw4=";
  })
  (fetchpatch2 {
    name = "uv-build.patch";
    url = "https://github.com/zostera/django-bootstrap3/commit/5e1a86549e9607b8e2a9772a3a839fc81b9ae6c0.patch?full_index=1";
    hash = "sha256-VcRC7ehyVTl0KuovD8tNCbZnKXKCOGpux1XXUOoDaTw=";
  })
  (fetchpatch2 {
    name = "uv-build.patch";
    url = "https://github.com/zostera/django-bootstrap4/commit/09b14bc9b70e7da92200c4bc014e2d3c597f0ea6.patch?full_index=1";
    hash = "sha256-ZW9y8n0ZCOP37EoP32e7ue6h93KgGw1pW8Q1Q8IuNk8=";
  })
  (fetchpatch2 {
    name = "uv-build.patch";
    url = "https://github.com/zostera/django-bootstrap5/commit/d1d54f5fc8041d2781189321402b4f3937f77913.patch?full_index=1";
    hash = "sha256-cFOY+pu2TAZXpAipSIQh1nPPC0ipfncvpObcH667+ac=";
  })
  (fetchpatch2 {
    name = "vim-keybindings.patch";
    url = "https://aur.archlinux.org/cgit/aur.git/plain/vim-keybindings.patch?h=htop-vim&id=d10f022b3ca1207200187a55f5b116a5bd8224f7";
    hash = "sha256-fZDTA2dCOmXxUYD6Wm41q7TxL7fgQOj8a/8yJC7Zags=";
  })
  (fetchpatch2 {
    name = "xrizer-fix-flaky-tests.patch";
    url = "https://github.com/Supreeeme/xrizer/commit/f58d797e75a8d920982abeaeedee83877dd3c493.diff?full_index=1";
    hash = "sha256-TI++ZY7QX1iaj3WT0woXApSY2Tairraao5kzF77ewYY=";
  })
  (fetchpatch2 {
    url = "https://aur.archlinux.org/cgit/aur.git/plain/cmake_min_version.patch?h=libgaminggear&id=bfe7db62db76dbcefa8ba47640a35c80183f91d3";
    hash = "sha256-loznfqxlucYlDUSYotMdUBmivKu+DD+OYhRIWpcrSgE=";
  })
  (fetchpatch2 {
    url = "https://bitbucket.org/multicoreware/x265_git/commits/ddb1933598736394b646cb0f78da4a4201ffc656/raw";
    hash = "sha256-ZH+jbVtfNJ+CwRUEgsnzyPVzajR/+4nDnUDz5RONO6c=";
    stripLen = 1;
  })
  (fetchpatch2 {
    url = "https://cygwin.com/cgit/cygwin-packages/moc/plain/Support-for-recent-ffmpeg-change.patch?id=ab70f1306b8416852915be4347003aac3bdc216";
    hash = "sha256-5hLEFBJ+7Nvxn6pNj4bngcg2qJsCzxiuP6yEj+7tvs0=";
    stripLen = 1;
  })
  (fetchpatch2 {
    url = "https://cygwin.com/cgit/cygwin-packages/moc/plain/ffmpeg-7.0.patch?id=ab70f1306b8416852915be4347003aac3bdc216e";
    hash = "sha256-dYw6DNyw61MGfv+GdBz5Dtrr9fVph1tf7vxexWONwF8=";
    stripLen = 1;
  })
  (fetchpatch2 {
    url = "https://gist.githubusercontent.com/hasufell/cb3b10f834e891d90f83/raw/cb4adda13868f6b94585575db4f8df70877ae45a/tome4-1.1.3-fix-implicit-declaration.patch";
    hash = "sha256-g47N/bi2/DDKqaEkfTaGp9ItS57QVnObzMDWXqrCjWE=";
  })
  (fetchpatch2 {
    url = "https://git.launchpad.net/~neil.mayhew/xpad/+git/xpad-1/patch/?id=637c7b51f1b09a28553a926f594f626d363c526a";
    hash = "sha256-ipebPkCpgj+5vvFS7QciZgH0CTZS12FdeVILfDReVsY=";
  })
  (fetchpatch2 {
    url = "https://github.com/AGProjects/blink-qt/commit/45343c90ae0680a3d03589fa8a12ac1eb85a6925.patch";
    hash = "sha256-XwV5L3r0IqWkhlaJypS2cHkDCcoumOgEEqDpdcaTviE=";
  })
  (fetchpatch2 {
    url = "https://github.com/AGProjects/sylkserver/commit/c0d943b4ff4401b2892b84d66e7cd27db7e6a927.patch";
    hash = "sha256-U0a8mRbt8c4lUcN2xYDfvXTt/sWcvi7F3/Vw5sIQPrU=";
  })
  (fetchpatch2 {
    url = "https://github.com/ArtifexSoftware/ghostpdl/commit/3c0be6e4fcffa63e4a5a1b0aec057cebc4d2562f.patch?full_index=1";
    hash = "sha256-NrL4lI19x+OHaSIwV93Op/I9k2MWXxSWgbkwSGU7R6A=";
  })
  (fetchpatch2 {
    url = "https://github.com/BrunoLevy/geogram/commit/2e1b6fba499ddc55b2150a1f610cf9f8d4934c39.patch";
    hash = "sha256-t6Pocf3VT8HpKOSh1UKKa0QHpsZyFqlAng6ltiAfKA8=";
  })
  (fetchpatch2 {
    url = "https://github.com/CelestiaProject/Celestia/commit/94894bed3bf98d41c5097e7829d491d8ff8d4a62.patch?full_index=1";
    hash = "sha256-hEZ6BhSEx6Qm+fLisc63xSCDT6GX92AHD0BuldOhzFk=";
  })
  (fetchpatch2 {
    url = "https://github.com/Cue/scales/commit/ee69d45f1a7f928f7b241702e9be06007444115e.patch?full_index=1";
    hash = "sha256-xBlgkh1mf+3J7GtNI0zGb7Sum8UYbTpUmM12sxK/fSU=";
  })
  (fetchpatch2 {
    url = "https://github.com/EnterpriseDB/barman/commit/931f997f1d73bbe360abbca737bea9ae93172989.patch?full_index=1";
    hash = "sha256-0aqyjsEabxLf4dpC4DeepmypAl7QfCedh7vy98iVifU=";
  })
  (fetchpatch2 {
    url = "https://github.com/Holarse-Linuxgaming/yaup/commit/c92134e305932785a60bd72131388f507b4d1853.patch?full_index=1";
    hash = "sha256-Exqkfp9VYIf9JpAc10cO8NuEAWvI5Houi7CLXV5zBDY=";
  })
  (fetchpatch2 {
    url = "https://github.com/KaHIP/KaHIP/commit/9d4978c7540a1ccbc9807367d6e3852114e86567.patch?full_index=1";
    hash = "sha256-nIJL0YmVp9+JUhzEXjoabD1qNEnhtrBnjMWnitYt0eU=";
  })
  (fetchpatch2 {
    url = "https://github.com/LibreOffice/core/commit/0ee2636304ac049f21415c67e92040f7d6c14d35.patch";
    includes = [ "sdext/*" ];
    hash = "sha256-8yipl5ln1yCNfVM8SuWowsw1Iy/SXIwbdT1ZfNw4cJA=";
  })
  (fetchpatch2 {
    url = "https://github.com/LibreOffice/core/commit/7848e02819c007026952a3fdc9da0961333dc079.patch";
    includes = [ "sdext/*" ];
    hash = "sha256-Nw6GFmkFy13w/ktCxw5s7SHL34auP1BQ9JvQnQ65aVU=";
  })
  (fetchpatch2 {
    url = "https://github.com/MarcelCoding/mailman3_exporter/commit/65070106451c6aafe8956387111343e490e34df8.patch?full_index=1";
    hash = "sha256-2XM0ktLC4+7/PEgeToVR84Gfjx1UKxl/+jo6JGnVZMw=";
  })
  (fetchpatch2 {
    url = "https://github.com/MarcelCoding/mailman3_exporter/commit/a7850a1e9ce65f91683eef67eb1c6537c2c2eb77.patch?full_index=1";
    hash = "sha256-bBIin/7Y1bWrvxCuw1kJG8gaoKjkKdQnxfqpRipvyFs=";
  })
  (fetchpatch2 {
    url = "https://github.com/Matoking/protontricks/commit/4198b7ea82369a91e3084d6e185f9b370f78eaec.patch";
    revert = true;
    hash = "sha256-1U/LiAliKtk3ygbIBsmoavXN0RSykiiegtml+bO8CnI=";
  })
  (fetchpatch2 {
    url = "https://github.com/Matoking/vdf/commit/981cad270c2558aeb8eccaf42cfcf9fabbbed199.patch";
    hash = "sha256-kLAbbB0WHjxq4rokLoGTPx43BU44EshteR59Ey9JnXo=";
  })
  (fetchpatch2 {
    url = "https://github.com/MmgTools/ParMmg/commit/a9551c502c58a1f8a109fb17d8f45cb9370f8fc6.patch?full_index=1";
    hash = "sha256-i0KwzseffeI9UYIYuyNYmdF9eTZ+nQQfSI6ukSowIYs=";
  })
  (fetchpatch2 {
    url = "https://github.com/OpenPHDGuiding/phd2/commit/0927de6c8943fae7161457008b989bf72a05c638.patch?full_index=1";
    hash = "sha256-yo5YdZ4B7jx6p4TqFZc7RJsutsWzeNBUfinFAd8es7E=";
  })
  (fetchpatch2 {
    url = "https://github.com/Prince213/jax/commit/af5c211d49f3b99447db2252d2cc2b8e0fb54d1c.patch?full_index=1";
    hash = "sha256-ijEd+MDe91qyYfE+aMzR5rNmTeGadin6Io8PIfJWc3o=";
  })
  (fetchpatch2 {
    url = "https://github.com/ReimuNotMoe/ydotool/commit/58fde33d9a8b393fd59348f71e80c56177b62706.patch?full_index=1";
    hash = "sha256-Ga9DPCzpJwtYVHWwKKl3kzn2BPEZBZ7uzbEY/eFXGs4=";
    includes = [ "CMakeLists.txt" ];
  })
  (fetchpatch2 {
    url = "https://github.com/RetroShare/libretroshare/commit/f1b89c4f87d77714571b4135c301bf0429096a20.patch?full_index=1";
    hash = "sha256-UiZMsUFaOZTLj/dx1rLr5bTR1CQ6nt2+IygQdvwJqwc=";
    stripLen = 1;
    extraPrefix = "libretroshare/";
  })
  (fetchpatch2 {
    url = "https://github.com/X16Community/x16-emulator/commit/3da83c93d46a99635cf73a6f9fdcf1bd4a4ae04f.patch";
    hash = "sha256-DZItqq7B1lXZ6VFsQUdQKn0wt1HaX4ymq2pI2DamY3w=";
  })
  (fetchpatch2 {
    url = "https://github.com/alexbatalov/fallout1-ce/commit/fbd25f00e9ccfb5391e394272d536206bb86678b.patch?full_index=1";
    sha256 = "sha256-MylI1DZwaANuScyRJ7fXch3aym8n6BDRhccAXAyvU70=";
  })
  (fetchpatch2 {
    url = "https://github.com/alexbatalov/fallout2-ce/commit/e770e64a48cd4d0a58a07f8db72839e4747e4c1e.patch?full_index=1";
    sha256 = "sha256-49N6uXwOBL/sE+f+W4nX6Gpwwpmbgvy38B1NjECiia0=";
  })
  (fetchpatch2 {
    url = "https://github.com/azahar-emu/azahar/commit/1f483e1d335374482845d0325ac8b13af3162c53.patch?full_index=1";
    hash = "sha256-9rmRbv7VFMhHly5qTGaeBLpvtWMu6HkCGUUM+t78Meg=";
  })
  (fetchpatch2 {
    url = "https://github.com/beancount/beangulp/commit/254bfb38ffed049ef8f3041bfaf01b3f5a8aa771.patch?full_index=1";
    hash = "sha256-ojysT23K0xmFafzTnRZiHkLS2ioDR/tVK02mfF7N9so=";
  })
  (fetchpatch2 {
    url = "https://github.com/bitcoin/bitcoin/commit/8acdf66540834b9f9cf28f16d389e8b6a48516d5.patch?full_index=1";
    hash = "sha256-oDvHUvwAEp0LJCf6QBESn38Bu359TcPpLhvuLX3sm6M=";
  })
  (fetchpatch2 {
    url = "https://github.com/bombono-dvd/bombono-dvd/commit/9f2cde1ddc22705bf58264739685086755b2138b.patch?full_index=1";
    hash = "sha256-ks6c04HEYF4nPfSOjzG+dUt9v7ZmNBb0XH6byPYqX5I=";
  })
  (fetchpatch2 {
    url = "https://github.com/bootc-dev/bootc/commit/ff8b1b411270275c49ee512d54b27ed7a2fca112.patch";
    hash = "sha256-7UKquq6ZargQUDGZk22X9Co92v8e995bL+tuAjvh/7c=";
  })
  (fetchpatch2 {
    url = "https://github.com/btel/svg_utils/commit/48b078a729aeb6b1160142ab65157474c95a61b6.patch?full_index=1";
    hash = "sha256-9toOFfNkgGF3TvM340vYOTkuSEHBeiyBRSGqqobfiqI=";
  })
  (fetchpatch2 {
    url = "https://github.com/btel/svg_utils/commit/931a80220be7c0efa2fc6e1d47858d69a08df85e.patch?full_index=1";
    hash = "sha256-SMv0i8p3s57TDn6NM17RrHF9kVgsy2YJJ0KEBQKn2J0=";
  })
  (fetchpatch2 {
    url = "https://github.com/byroot/pysrt/commit/93f52f6d4f70f4e18dc71deeaae0ec1e9100a50f.patch?full_index=1";
    hash = "sha256-nikMPwj3OHvl6LunAfRk6ZbFUvVgPwF696Dt8R7BY4U=";
  })
  (fetchpatch2 {
    url = "https://github.com/cemu-project/Cemu/commit/c1c2962b6633017cd956c6925288e2529c532ee4.diff?full_index=1";
    sha256 = "sha256-Dz7WnCf5+Vbr/ETX71wIo/x/zPWdrsOtPH7bsL5Bd+A=";
  })
  (fetchpatch2 {
    url = "https://github.com/chromium/chromium/commit/b0ff8c3b258a8816c05bdebf472dbba719d3c491.patch?full_index=1";
    stripLen = 1;
    extraPrefix = "src/3rdparty/chromium/";
    hash = "sha256-zDIlHd8bBtrThkFnrcyA13mhXYIQt6sKsi6qAyQ34yo=";
  })
  (fetchpatch2 {
    url = "https://github.com/dgibson/dtc/commit/9a969f3b70b07bbf1c9df44a38d7f8d1d3a6e2a5.patch";
    hash = "sha256-YrRzc3ATNmU6LYNHEQeU8wtjt1Ap7/gNFvtRR14PQEE=";
  })
  (fetchpatch2 {
    url = "https://github.com/dgibson/dtc/commit/ce1d8588880aecd7af264e422a16a8b33617cef7.patch";
    hash = "sha256-t1CxKnbCXUArtVcniAIdNvahOGXPbYhPCZiTynGLvfo=";
  })
  (fetchpatch2 {
    url = "https://github.com/dlbeer/quirc/commit/257c6c94d99960819ecabf72199e5822f60a3bc5.patch?full_index=1";
    hash = "sha256-WLQK7vy34VmgJzppTnRjAcZoSGWVaXQSaGq9An8W0rw=";
  })
  (fetchpatch2 {
    url = "https://github.com/dlbeer/quirc/commit/2c350d8aaf37246e538a2c93b2cce8c78600d2fc.patch?full_index=1";
    hash = "sha256-ZTcy/EoOBoyOjtXjmT+J/JcbX8lxGKmbWer23lymbWo=";
  })
  (fetchpatch2 {
    url = "https://github.com/dolphin-emu/dolphin/commit/8edef722ce1aae65d5a39faf58753044de48b6e0.patch?full_index=1";
    hash = "sha256-QEG0p+AzrExWrOxL0qRPa+60GlL0DlLyVBrbG6pGuog=";
  })
  (fetchpatch2 {
    url = "https://github.com/dvdfu/ld38/commit/808537065a8dacc903e3d704b381f61b11f91d47.patch?full_index=1";
    hash = "sha256-iXFQWRU2hbKjVGjkwZKgxckRpr3/DUXczNNuMz48ktA=";
  })
  (fetchpatch2 {
    url = "https://github.com/eProsima/Fast-DDS-Gen/commit/b1b66d587f38d4fd6227aa1969c3a10c2095ae7d.patch";
    hash = "sha256-qVp9Xk8og8Ga2BMiqt2BFM0lAtDnmmwzteceievfcXE=";
  })
  (fetchpatch2 {
    url = "https://github.com/eProsima/IDL-Parser/commit/801ed2f671322c0134b8db180529c9a400d5ed2b.patch";
    stripLen = 1;
    extraPrefix = "thirdparty/idl-parser/";
    includes = [ "thirdparty/idl-parser/build.gradle" ];
    hash = "sha256-OzywQ02yaMnya+536DeHWeKwZefI4meYqmZcp3onwR8=";
  })
  (fetchpatch2 {
    url = "https://github.com/eiskaltdcpp/eiskaltdcpp/commit/5ab5e1137a46864b6ecd1ca302756da8b833f754.patch?full_index=1";
    hash = "sha256-GIdcIHKXNSbHxbiMGRPgfq2w/zNSfR/FhyyXayFWfg8=";
  })
  (fetchpatch2 {
    url = "https://github.com/endrazine/wcc/commit/4bea2dac8b49d82e4f72e42027d74fc654380f7b.patch?full_index=1";
    hash = "sha256-RK0ue8hdK/G+njwGmWpaewclRHprO8aBdZ9vBGQIQOc=";
  })
  (fetchpatch2 {
    url = "https://github.com/febiosoftware/FEBio/commit/ad9e80e2aa8737828855458a703822f578db2fd3.patch?full_index=1";
    hash = "sha256-/uLnJB/oAwLQnsZtJnUlaAEpyZVLG6o2riRwwMCH8rI=";
  })
  (fetchpatch2 {
    url = "https://github.com/fedora-modularity/libmodulemd/commit/29c339a31b1c753dcdef041e5c2e0e600e48b59d.patch";
    hash = "sha256-uniHrQdbcXlJk2hq106SgV/E330LfxDc07E4FbOMLr0=";
  })
  (fetchpatch2 {
    url = "https://github.com/fedora-modularity/libmodulemd/commit/9d2809090cc0cccd7bab67453dc00cf43a289082.patch";
    hash = "sha256-dMtc6GN6lIDjUReFUhEFJ/8wosASo3tLu4ve72BCXQ8=";
  })
  (fetchpatch2 {
    url = "https://github.com/fedora-modularity/libmodulemd/commit/f3336199b4e69af3305f156abc7533bed9e9a762.patch";
    hash = "sha256-Rvg+/KTKiEBXVEK7tlcTDf53HkaW462g/rg1rHPzaZA=";
  })
  (fetchpatch2 {
    url = "https://github.com/fedora-python/python-ethtool/commit/f82dd763bd50affda993b9afe3b141069a1a7466.patch";
    hash = "sha256-mtI7XsoyM43s2DFQdsBNpB8jJff7ZyO2J6SHodBrdrI=";
  })
  (fetchpatch2 {
    url = "https://github.com/fishfolk/jumpy/commit/8234e6d2c0b33c75e2112596ded1734fdba50fb8.patch?full_index=1";
    hash = "sha256-IWjBw1Wj/6CT/x6xm6vfpUMfk7A5/EsdbPDvWywRFc8=";
  })
  (fetchpatch2 {
    url = "https://github.com/flashinfer-ai/flashinfer/commit/a42f99255d68d1a54b689bd4985339c6b44963a6.patch?full_index=1";
    hash = "sha256-3XJFcdQeZ/c5fwiQvd95z4p9BzTn8pjle21WzeBxUgk=";
  })
  (fetchpatch2 {
    url = "https://github.com/florisla/stm32loader/commit/96f59b2984b0d0371b2da0360d6e8d94d0b39a68.patch?full_index=1";
    hash = "sha256-JUEjQWOnzeMA1OELS214OR7+MYUkCKN5lxwsmRoFbfo=";
  })
  (fetchpatch2 {
    url = "https://github.com/gtkd-developers/GtkD/commit/1e41b2da35c7dc2d18b118c632cb07137d048c2b.patch?full_index=1";
    hash = "sha256-8vQntjVrQH1+qHBBkB5PxcgLvucosEEPi43uqlnHe4g=";
  })
  (fetchpatch2 {
    url = "https://github.com/halide/Halide/commit/59f4fff30f4ab628da9aa7e5f77a7f1bb218a779.diff?full_index=1";
    hash = "sha256-yOzE+1jai1w1GQisLYfu8F9pbTE/bYg0MTLq8rPXdGk=";
  })
  (fetchpatch2 {
    url = "https://github.com/halide/Halide/commit/ac2cd23951aff9ac3b765e51938f1e576f1f0ee9.diff?full_index=1";
    hash = "sha256-JTktOTSyReDUEHTaPPMoi+/K/Gzg39i6MI97cO3654k=";
  })
  (fetchpatch2 {
    url = "https://github.com/hluk/CopyQ/commit/103903593c37c9db5406d276e0097fbf18d2a8c4.patch?full_index=1";
    hash = "sha256-zywE6ntMw+WvTyilXwvd4lfQRAAB9R/AGpwtwwPFZZE=";
  })
  (fetchpatch2 {
    url = "https://github.com/hthiery/python-lacrosse/commit/cc2623c667bc252360a9b5ccb4fc05296cf23d9c.patch?full_index=1";
    hash = "sha256-LKryLnXMKj1lVClneyHNVOWM5KPPhOGy0/FX/7Qy/jU=";
  })
  (fetchpatch2 {
    url = "https://github.com/iterative/shtab/commit/a04ddf92896f7e206c9b19d48dcc532765364c59.patch?full_index=1";
    hash = "sha256-H4v81xQLI9Y9R5OyDPJevCLh4gIUaiJKHVEU/eWdNbA=";
  })
  (fetchpatch2 {
    url = "https://github.com/jarro2783/cxxopts/commit/e98c73d665915b292a0592bf34fcbe8522035bc1.patch?full_index=1";
    name = "fix-icu-uc-typo-in-pkgconfig.patch";
    hash = "sha256-bqd3H66Op1/EkN2HLd84Obky4Y2ndPPY8MGZ5fqtdk4=";
  })
  (fetchpatch2 {
    url = "https://github.com/jart/fabulous/commit/5779f2dfbc88fd81b5b5865247913d4775e67959.patch?full_index=1";
    hash = "sha256-miWFt4vDpwWhSUgnWDjWUXoibijcDa1c1dDOSkfWoUg=";
  })
  (fetchpatch2 {
    url = "https://github.com/jmschrei/apricot/commit/ffa5cce97292775c0d6890671a19cacd2294383f.patch?full_index=1";
    hash = "sha256-9A49m4587kAPK/kzZBqMRPwuA40S3HinLXaslYUcWdM=";
  })
  (fetchpatch2 {
    url = "https://github.com/jsummers/imageworsener/commit/91c7c79d86f55920193d17a7b87631b14ac7779f.patch?full_index=1";
    hash = "sha256-8vxht0FiQFOdglwaO0ZQpg5BNYXXHROkznZ+Caxm/v0=";
  })
  (fetchpatch2 {
    url = "https://github.com/jubalh/nudoku/commit/c5fd9156d2d1f2c95a5d87b07adeaee90a7f911d.patch?full_index=1";
    hash = "sha256-nvLKAUCDY3fQWjybVX8DaMBdk5CaegRRb/ENTI9kJ9k=";
  })
  (fetchpatch2 {
    url = "https://github.com/kkroening/ffmpeg-python/commit/557ed8e81ff48c5931c9249ec4aae525347ecf85.patch?full_index=1";
    hash = "sha256-XrL9yLaBg1tu63OYZauEb/4Ghp2zHtiF6vB+1YYbv1Y=";
  })
  (fetchpatch2 {
    url = "https://github.com/kkroening/ffmpeg-python/commit/dce459d39ace25f03edbabdad1735064787568f7.patch?full_index=1";
    hash = "sha256-ZptCFplL88d0p2s741ymHiwyDsDGVFylBJ8FTrZDGMc=";
  })
  (fetchpatch2 {
    url = "https://github.com/kkroening/ffmpeg-python/commit/eeaa83398ba1d4e5b470196f7d4c7ca4ba9e8ddf.patch?full_index=1";
    hash = "sha256-/qxez4RF/RPRr9nA+wp+XB49L3VNgnMwMQhFD2NwijU=";
  })
  (fetchpatch2 {
    url = "https://github.com/kura/yarg/commit/8d5532e4da11ab0e9a4453658cf0591dcf80a616.patch?full_index=1";
    hash = "sha256-2lbOzEfWTtoZYuRjCQJAFeYUsJoQhhEohflvYOwLXnI=";
  })
  (fetchpatch2 {
    url = "https://github.com/leahneukirchen/outils/commit/50877e1bf7c905044e0b50b227ecff48cfec394b.patch?full_index=1";
    name = "outils-add-recallocarray-prototype.patch";
    hash = "sha256-jOnCMPcHKMRR3J0Yh+ZTHAn7P85FO80yXVX0K2vtlVk=";
  })
  (fetchpatch2 {
    url = "https://github.com/libsdl-org/sdl2-compat/commit/b799076c72c2492224e81544f58f92b737cccbd3.patch?full_index=1";
    hash = "sha256-fAc8yBlT+XFHDKcF4MFgBAz2WtXGmhYzNNrjaGSr+do=";
  })
  (fetchpatch2 {
    url = "https://github.com/liran-funaro/sphinx-markdown-builder/commit/967edca036a73f7644251abd52a5da8451a10dd4.patch";
    hash = "sha256-FGMYzd5k3Q0UvOccCvUSW3y6gor+AUncj2qv38xyOp4=";
  })
  (fetchpatch2 {
    url = "https://github.com/mailgun/expiringdict/commit/1c0f82232d20f8b3b31c9269a4d0e9510c1721a6.patch";
    hash = "sha256-IeeJVb2tOwRhEPNGqM30fNZyz3jFcnZNWC3I6K1+hSY=";
  })
  (fetchpatch2 {
    url = "https://github.com/mailgun/expiringdict/commit/976faf3664d54049e443aca054f5819db834577b.patch";
    hash = "sha256-FNdnU6iUMyED5j8oAjhmJTR7zQeEc/Z5s64pdeT4F8w=";
  })
  (fetchpatch2 {
    url = "https://github.com/matinlotfali/KDE-Rounded-Corners/commit/5d63212e65ed06ca65a2a7f0ad2436045b839ddd.patch";
    hash = "sha256-wfjxMKRmJu3gflldNvWLghw5oFyyxY2ml1lsl/TVzxI=";
  })
  (fetchpatch2 {
    url = "https://github.com/milgra/sov/commit/8677dcfc47e440157388a8f15bdda9419d84db04.patch";
    hash = "sha256-P1k1zosHcVO7hyhD1JWbj07h7pQ7ybgDHfoufBinEys=";
  })
  (fetchpatch2 {
    url = "https://github.com/ngoduykhanh/wireguard-ui/commit/2fdafd34ca6c8f7f1415a3a1d89498bb575a7171.patch?full_index=1";
    hash = "sha256-nq/TX+TKDB29NcPQ3pLWD0jcXubULuwqisn9IcEW8B8=";
  })
  (fetchpatch2 {
    url = "https://github.com/nipy/nibabel/commit/3f40a3bc0c4bd996734576a15785ad0f769a963a.patch?full_index=1";
    hash = "sha256-URsxgP6Sd5IIOX20GtAYtWBWOhw+Hiuhgu1oa8o8NXk=";
  })
  (fetchpatch2 {
    url = "https://github.com/nipy/nipy/pull/589/commits/76f2aae95dede9b8ac025dc32ce94791904f25e4.patch?full_index=1";
    hash = "sha256-Rnwfx6JKl+nE9wvBGKXFtizjuB4Bl1QDF88CvSZU/RQ=";
  })
  (fetchpatch2 {
    url = "https://github.com/nodejs/gyp-next/commit/706d04aba5bd18f311dc56f84720e99f64c73466.patch?full_index=1";
    hash = "sha256-1iyeeAprmWpmLafvOOXW45iZ4jWFSloWJxQ0reAKBOo=";
    stripLen = 1;
    extraPrefix = "deps/npm/node_modules/node-gyp/gyp/";
  })
  (fetchpatch2 {
    url = "https://github.com/nodejs/gyp-next/commit/706d04aba5bd18f311dc56f84720e99f64c73466.patch?full_index=1";
    hash = "sha256-iV9qvj0meZkgRzFNur2v1jtLZahbqvSJ237NoM8pPZc=";
    stripLen = 1;
    extraPrefix = "tools/gyp/";
  })
  (fetchpatch2 {
    url = "https://github.com/nodejs/node/commit/499a5c345165f0d4a94b98d08f1ace7268781564.patch?full_index=1";
    hash = "sha256-wF4+CytC1OB5egJGOfLm1USsYY12f9kADymVrxotezE=";
  })
  (fetchpatch2 {
    url = "https://github.com/nodejs/node/commit/8caa1dcee63b2c6fd7a9edf9b9a6222b38a2cf62.patch?full_index=1";
    hash = "sha256-DtN0bpYfo5twHz2GrLLgq4Bu2gFYTkNPMRKhrgeYRyA=";
    includes = [ "test/parallel/test-setproctitle.js" ];
  })
  (fetchpatch2 {
    url = "https://github.com/obsproject/obs-studio/commit/26dfacbd4f5217258a2f1c5472a544c65a182d10.patch?full_index=1";
    hash = "sha256-gEWDzZ+GPCR+rmytXcbiBcvzLg8VwZCveMKkvho3COI=";
  })
  (fetchpatch2 {
    url = "https://github.com/odoo/odoo/commit/ade3200e8138a9c28eb9b294a4efd2753a8e5591.patch?full_index=1";
    hash = "sha256-EFKjrR38eg9bxlNmRNoLSXem+MjQKqPcR3/mSgs0cDs=";
  })
  (fetchpatch2 {
    url = "https://github.com/pierotofy/OpenSplat/commit/7fb96e86a43ac6cfd3eb3a7f6be190c5f2dbeb73.patch";
    hash = "sha256-hWJWU/n1pRAAbExAYUap6CoSjIu2dzCToUmacSSpa0I=";
  })
  (fetchpatch2 {
    url = "https://github.com/pytest-dev/nose2pytest/commit/75ff506aaf11b5e20672441730657ee7540387e1.patch?full_index=1";
    hash = "sha256-BpazrsB4b1oMBx9OemdVxhj/Jqbc8RKv2GC6gqkdGK8=";
  })
  (fetchpatch2 {
    url = "https://github.com/rhboot/pesign/commit/1f9e2fa0b4d872fdd01ca3ba81b04dfb1211a187.patch?full_index=1";
    hash = "sha256-viVM4Z0jAEAWC3EdJVHcWe21aQskH5XE85lOd6Xd/qU=";
  })
  (fetchpatch2 {
    url = "https://github.com/rpy2/rpy2/commit/524546eef9b8f7f3d61aeb76d7e7fa7beeabd2d2.patch?full_index=1";
    hash = "sha256-aR44E8wIBlD7UpQKm7B+aMn2p3FQ8dwBwLwkibIpcuM=";
    relative = "rpy2-robjects";
    revert = true;
  })
  (fetchpatch2 {
    url = "https://github.com/rspamd/rspamd/commit/d808fd75ff1db1821b1dd817eb4ba9a118b31090.patch";
    hash = "sha256-v1Gn3dPxN/h92NYK3PTrZomnbwUcVkAWcYeQCFzQNyo=";
  })
  (fetchpatch2 {
    url = "https://github.com/smallstep/certificates/commit/b7e59c97f3b8a95a24153aeb85959118953f2bb4.patch?full_index=1";
    hash = "sha256-GKGKUj4hpS4jo6sMvUhnD3BeE+f5vnxY5tK0a2pwpNM=";
  })
  (fetchpatch2 {
    url = "https://github.com/sonic-visualiser/svcore/commit/5a7b517e43b7f0b3f03b7fc3145102cf4e5b0ffc.patch";
    stripLen = 1;
    extraPrefix = "svcore/";
    hash = "sha256-DOCdQqCihkR0g/6m90DbJxw00QTpyVmFzCxagrVWKiI=";
  })
  (fetchpatch2 {
    url = "https://github.com/sonic-visualiser/svcore/commit/5a7b517e43b7f0b3f03b7fc3145102cf4e5b0ffc.patch";
    stripLen = 1;
    extraPrefix = "svcore/";
    sha256 = "sha256-DOCdQqCihkR0g/6m90DbJxw00QTpyVmFzCxagrVWKiI=";
  })
  (fetchpatch2 {
    url = "https://github.com/sonic-visualiser/svgui/commit/5b6417891cff5cc614e8c96664d68674eb12b191.patch";
    stripLen = 1;
    extraPrefix = "svgui/";
    excludes = [ "svgui/widgets/CSVExportDialog.cpp" ];
    hash = "sha256-pBCtoMXgjreUm/D0pl6+R9x1Ovwwwj8Ohv994oMX8XA=";
  })
  (fetchpatch2 {
    url = "https://github.com/supercollider/sc3-plugins/commit/3dc56bf7fcc1f2261afc13f96da762b78bcbfa51.patch";
    hash = "sha256-lvXvGunfmjt6i+XPog14IKdnH1Qk8vefxplSDkXXXHU=";
  })
  (fetchpatch2 {
    url = "https://github.com/symengine/symengine/commit/186f72e208220efd12362c336a49378076f63f30.patch?full_index=1";
    hash = "sha256-CuQra9K3MTxm8M0bt3LooJz9HgW0/Jy6ydRBCvEgkO4=";
  })
  (fetchpatch2 {
    url = "https://github.com/symengine/symengine/commit/c149b874b8ff947e51e8e58670a0d37daf588f86.patch?full_index=1";
    hash = "sha256-LqkJRPdsbE8OE8G6AkpWX9B+GqnOQjUNPHpKKIcCL3Q=";
  })
  (fetchpatch2 {
    url = "https://github.com/tpm2-software/tpm2-pytss/commit/afdee627d0639eb05711a2191f2f76e460793da9.patch?full_index=1";
    hash = "sha256-Y6drcBg4gnbSvnCGw69b42Q/QfLI3u56BGRUEkpdB0M=";
  })
  (fetchpatch2 {
    url = "https://github.com/transmission/transmission/commit/febfe49ca3ecab1a7142ecb34012c1f0b2bcdee8.patch?full_index=1";
    hash = "sha256-Ge0+AXf/ilfMieGBAdvvImY7JOb0gGIdeKprC37AROs=";
    excludes = [
      # The submodule that we don't use (we use our miniupnp)
      "third-party/miniupnp"
      # Hunk fails for this one, but we don't care because we don't rely upon
      # xcode definitions even for the Darwin build.
      "Transmission.xcodeproj/project.pbxproj"
    ];
  })
  (fetchpatch2 {
    url = "https://github.com/trbs/pid/commit/c9d1550ba2ee73231f8e984d75d808c8cc103748.patch";
    hash = "sha256-2F31LlrJku1xzmI7P+QLyUZ8CzVHx25APp88qwWkZxw=";
  })
  (fetchpatch2 {
    url = "https://github.com/truenas/py-libzfs/commit/b5ffe1f1d6097df6e2f5cc6dd3c968872ec60804.patch";
    hash = "sha256-6r5hQ/o7c4vq4Tfh0l1WbeK3AuPvi+1wzkwkIn1qEes=";
  })
  (fetchpatch2 {
    url = "https://github.com/trustcrypto/OnlyKey-App/commit/b8918cec80f5feda50c24a0aec3d6fb914ea8481.patch";
    hash = "sha256-ULMZI7fo5SJGrfCRqZzZVoGOTDQ8q/NG/uXMjNkQ+qk=";
  })
  (fetchpatch2 {
    url = "https://github.com/vmware/tdnf/commit/24211f2077d2423e511c43f21cd5ee5b53fa4021.patch?full_index=1";
    hash = "sha256-twzyVV+VgtRljj1E70Tq5U0sNEiSWU/rG9buoAYDF0o=";
  })
  (fetchpatch2 {
    url = "https://github.com/wez/govee-lan-hass/commit/b4cecac5ae00d95c49fcfe3bbfc405cbfc5dd84c.patch";
    hash = "sha256-+MPO4kxxE1nZ/+sIY7v8WukHMrVowgMMBVfRDw2uv8o=";
  })
  (fetchpatch2 {
    url = "https://github.com/xmendez/wfuzz/commit/f4c028b9ada4c36dabf3bc752f69f6ddc110920f.patch?full_index=1";
    hash = "sha256-t7pUMcdFmwAsGUNBRdZr+Jje/yR0yzeGIgeYNEq4hFE=";
  })
  (fetchpatch2 {
    url = "https://github.com/xsco/libdjinterop/commit/94ce315cd5155bd031eeccfec12fbeb8e399dd14.patch";
    hash = "sha256-WahMsFeetSlHHiIyaC04YxTiXDxD1ooASqoIP2TK9R0=";
  })
  (fetchpatch2 {
    url = "https://github.com/yandex/gixy/compare/6f68624a7540ee51316651bda656894dc14c9a3e...b1c6899b3733b619c244368f0121a01be028e8c2.patch";
    hash = "sha256-6VUF2eQ2Haat/yk8I5qIXhHdG9zLQgEXJMLfe25OKEo=";
  })
  (fetchpatch2 {
    url = "https://gitlab.alpinelinux.org/alpine/aports/-/raw/152dc14a65a89f253294cc5b4c96cf0d6658711a/main/unfs3/implicit.patch";
    hash = "sha256-zrF87fJhc8mDgIs0vsMoqIHYQPtKWn2XMBSePvHOByA=";
  })
  (fetchpatch2 {
    url = "https://gitlab.archlinux.org/archlinux/packaging/packages/libreoffice-fresh/-/raw/f7b0e4385108b95c134599502a7bccf0a41925c8/poppler-25.10.patch";
    hash = "sha256-KMsjDtRRH8Vy/FXaVwxUo0Ww10PCE0sK8+ZL0Ja2kJQ=";
  })
  (fetchpatch2 {
    url = "https://gitlab.archlinux.org/archlinux/packaging/packages/libreoffice-still/-/raw/f5241554e4a0f6fd95ac4e5cc398a30243407e6a/fix_build_with_poppler_25.10.patch";
    hash = "sha256-lbPOkc1HeT5Qsp6XfVyVJtmvSL68qTrmbd3q9lvKSu8=";
  })
  (fetchpatch2 {
    url = "https://gitlab.archlinux.org/archlinux/packaging/packages/minidlna/-/raw/affcf0dd1e6f8e33d0ba90b2b0733736fa1aeb71/ffmpeg7.patch";
    hash = "sha256-MZFPY4FywoMkZ//fKml6o5J1QG5qiScgtI+KFw5hENw=";
  })
  (fetchpatch2 {
    url = "https://gitlab.com/-/project/6684464/uploads/462c0b1cf05c3fc2857ce982e62fefcc/0001-Don-t-clear-line-rendition-on-partial-ED.patch";
    hash = "sha256-lSuxP0tUfGa3BjK3ehpdMi16XaGZrdVvAcM2vnjAme8=";
  })
  (fetchpatch2 {
    url = "https://gitlab.com/-/project/6684464/uploads/812bdfdfaee44eed346fcff85f53efbe/0002-DECCOLM-should-clear-line-rendition-attributes.patch";
    hash = "sha256-XO+h5fpBTLLYC3t4FRCy1uFiMkmSXbre4T2NB/FC3uQ=";
  })
  (fetchpatch2 {
    url = "https://gitlab.com/-/project/6684464/uploads/c2ceaef82d483c13ff9ec64424f3c40a/0001-Fix-ICH-with-count-1.patch";
    hash = "sha256-lCqj4p8onUS4pehQMXS6lbC7JH5dP6sOjDALpasgd2M=";
  })
  (fetchpatch2 {
    url = "https://gitlab.com/cznic/golex/-/commit/a735a3b62b5fb36a715ba4e280270f9ca91c5e59.patch";
    hash = "sha256-Q/Vyh91IwL3ConWpJU0akslkaVhHTkBmrMbmDVU3Txs=";
  })
  (fetchpatch2 {
    url = "https://gitlab.com/drobilla/fomp/-/commit/f8e4e1e0b1abe3afd2ea17b13795bbe871fccece.patch";
    hash = "sha256-uJpUwTEBOp0Zo7zKT9jekhtkg9okUvGTavLIQmNKutU=";
  })
  (fetchpatch2 {
    url = "https://gitlab.gnome.org/GNOME/gtksourceview/-/commit/1dbbb01da98140e0b2d5d0c6c2df29247650ed83.patch";
    hash = "sha256-6HxLKQyI5DDvmKhmldQlwVPV62RfFa2gwWbcHA2cICs=";
  })
  (fetchpatch2 {
    url = "https://gitlab.gnome.org/GNOME/gtksourceview/-/commit/685b3bd08869c2aefe33fad696a7f5f2dc831016.patch";
    hash = "sha256-yeYXJ2l/QS857C4UXOnMFyh0JsptA0TQt0lfD7wN5ic=";
  })
  (fetchpatch2 {
    url = "https://invent.kde.org/education/kstars/-/commit/ce53888e6dbaeb1b9239fca55288b5ead969b5a7.diff";
    hash = "sha256-awZeOLlG1vlCWC+QfypqHIIYexpywRmNT1ACdkqqLt4=";
  })
  (fetchpatch2 {
    url = "https://patch-diff.githubusercontent.com/raw/ThrowTheSwitch/Unity/pull/771.patch";
    hash = "sha256-r8ldVb7WrzVwTC2CtGul9Jk4Rzt+6ejk+paYAfFlR5M=";
  })
  (fetchpatch2 {
    url = "https://patch-diff.githubusercontent.com/raw/ThrowTheSwitch/Unity/pull/790.patch";
    hash = "sha256-K+OxMe/ZMXPPjZXjGhgc5ULLN7plBwL0hV5gwmgA3FM=";
  })
  (fetchpatch2 {
    url = "https://patch-diff.githubusercontent.com/raw/vmware/tdnf/pull/410.patch";
    hash = "sha256-p/ix5O1J/lj2fw7qJokT+wPN4ROoulnVqByfxgFvuEo=";
  })
  (fetchpatch2 {
    url = "https://raw.githubusercontent.com/nmeum/android-tools/0c4d79943e23785589ce1881cbb5a9bc76d64d9b/patches/extras/0003-extras-libjsonpb-Fix-incompatibility-with-protobuf-v.patch";
    stripLen = 1;
    extraPrefix = "vendor/extras/";
    hash = "sha256-PO6ZKP54ri2ujVa/uFXgMy/zMQjjIo4e/EPW2Cu6a1Q=";
  })
  (fetchpatch2 {
    url = "https://raw.githubusercontent.com/spack/spack-packages/eb4b23847f0079d0c9c8de99aaa32557ad4c9194/repos/builtin/packages/hypre/hypre-precision-fix.patch?full_index=1";
    hash = "sha256-Ni5xlfFmok884x5Hctf9VOsAgZp8ICG7QNVGTdVKPzE=";
  })
  (fetchpatch2 {
    url = "https://salsa.debian.org/debian-gis-team/osm-gps-map/-/raw/debian/1.2.0-4/debian/patches/0001-Drop-support-for-libsoup-older-than-2.42.patch";
    hash = "sha256-9KSqXV1ZO21nERlhp0/nZkMuGuMpsr1RfszKkTjyvSo=";
  })
  (fetchpatch2 {
    url = "https://salsa.debian.org/debian-gis-team/osm-gps-map/-/raw/debian/1.2.0-4/debian/patches/0001-Port-to-libsoup3.patch";
    hash = "sha256-/Ss/rGm08UXmSpDMNGlS79eQ35sOyU8vAMC9eEBOgKg=";
    excludes = [ ".github/*" ];
  })
  (fetchpatch2 {
    url = "https://salsa.debian.org/debian/ghostscript/-/raw/01e895fea033cc35054d1b68010de9818fa4a8fc/debian/patches/2010_add_build_timestamp_setting.patch";
    hash = "sha256-XTKkFKzMR2QpcS1YqoxzJnyuGk/l/Y2jdevsmbMtCXA=";
  })
  (fetchpatch2 {
    url = "https://salsa.debian.org/debian/pngcrush/-/raw/b4856b56fbc28252103cc14d156baddd564ca880/debian/patches/ignore_PNG_IGNORE_ADLER32.patch";
    hash = "sha256-pFON/NUJiXMe9GETptgNltWa0izlby6P/fLsG1abz3g=";
  })
  (fetchpatch2 {
    url = "https://salsa.debian.org/python-team/packages/py-libzfs/-/raw/debian/0.0+git20240510.5ae7d5e-1/debian/patches/fix-compilation-on-gcc-14.patch";
    hash = "sha256-KLxRx2k1LQGtmzMqJe9b84ApOnIXn8ZeBZun5BAxEjc=";
  })
  (fetchpatch2 {
    url = "https://sources.debian.org/data/main/libe/libextractor/1%3A1.13-4/debian/patches/exiv2-0.28.diff";
    hash = "sha256-Re5iwlSyEpWu3PcHibaRKSfmdyHSZGMOdMZ6svTofvs=";
  })
  (fetchpatch2 {
    url = "https://src.fedoraproject.org/rpms/psacct/raw/rawhide/f/psacct-6.6.4-sprintf-buffer-overflow.patch";
    hash = "sha256-l74tLIuhpXj+dIA7uAY9L0qMjQ2SbDdc+vjHMyVouFc=";
  })
  (fetchpatch2 {
    name = "algebraic-graphs-0.7-allow-inspection-testing-0.6.patch";
    url = "https://github.com/snowleopard/alga/commit/d4e43fb42db05413459fb2df493361d5a666588a.patch";
    hash = "sha256-feGEuALVJ0Zl8zJPIfgEFry9eH/MxA0Aw7zlDq0PC/s=";
  })
  (fetchpatch2 {
    name = "use-more-flexible-build-script.patch";
    url = "https://github.com/KiranWells/Lyra-Cursors/commit/2735acb37a51792388497c666cc28370660217cb.patch?full_index=1";
    hash = "sha256-KCT4zNdep1TB7Oa4qrPw374ahT30o9/QrNTEgobp8zM=";
  })
  (fetchpatch2 {
    url = "https://gitlab.archlinux.org/archlinux/packaging/packages/redis/-/raw/102cc861713c796756abd541bf341a4512eb06e6/redis-5.0-use-system-jemalloc.patch";
    hash = "sha256-A9qp+PWQRuNy/xmv9KLM7/XAyL7Tzkyn0scpVCGngcc=";
  })
]
++ (
  let
    urlFor =
      name:
      "https://raw.githubusercontent.com/linusg/serenityos-emoji-font/11c84f33777a5d5bbe97ef2ffe8b74af7d72d27f/patches/${name}.patch";
  in
  [
    (fetchpatch2 {
      url = urlFor "0001-pixart2svg-rgba";
      extraPrefix = "./";
      hash = "sha256-/4a6btqp/6yiBnFhr4vI+SWfOopUjzDfOeW1Fs6Z5yU=";
    })
    (fetchpatch2 {
      url = urlFor "0002-pixart2svg-no-style";
      extraPrefix = "./";
      hash = "sha256-FVurs+bEOat74d2egl21JS5ywdkFKKIsqXSFGSJI8MI=";
    })
    (fetchpatch2 {
      url = urlFor "0003-pixart2svg-imageio-deprecation-warning";
      extraPrefix = "./";
      hash = "sha256-Vo3JIcXof+AtuEbsczNS3CUaBUEncCR0pnIuY4uF7R4=";
    })
  ]
)
++ (
  let
    patchSource = "https://salsa.debian.org/science-team/netgen/-/raw/debian/6.2.2404+dfsg1-5/debian/patches";
  in
  [
    (fetchpatch2 {
      url = "${patchSource}/ffmpeg_link_libraries.patch";
      hash = "sha256-S02OPH9hbJjOnBm6JMh6uM5XptcubV24vdyEF0FusoM=";
    })
    (fetchpatch2 {
      url = "${patchSource}/fix_nggui_tcl.patch";
      hash = "sha256-ODDT67+RWBzPhhq/equWsu78x9L/Yrs3U8VQ1Uu0zZw=";
    })
    (fetchpatch2 {
      url = "${patchSource}/include_stdlib.patch";
      hash = "sha256-W+NgGBuy/UmzVbPTSqR8FRUlyN/9dl9l9e9rxKklmIc=";
    })
    (fetchpatch2 {
      url = "${patchSource}/use-local-catch2.patch";
      hash = "sha256-h4ob8tl6mvGt5B0qXRFNcl9MxPXxRhYw+PrGr5iRGGk=";
    })
  ]
)
++ (
  let
    guiSourcePath = "internal/frontend/bridge-gui";
  in
  [
    (fetchpatch2 {
      url = "https://github.com/daniel-fahey/proton-bridge/commit/7823fe4904186253798fc633724988d43dd642e0.patch?full_index=1";
      relative = guiSourcePath;
      hash = "sha256-2heMfZdXLL8/uyM0jZ860Jw76c+gHtc0G6pWmIRCONY=";
    })
    (fetchpatch2 {
      url = "https://github.com/daniel-fahey/proton-bridge/commit/9b282369523ce2aabcf95369a2ed3867efb5a4ac.patch?full_index=1";
      relative = guiSourcePath;
      hash = "sha256-CGBelsplAqLI+6GtDR+VELfVsLoHPN0324gfZ3obKpI=";
    })
  ]
)
++ (
  let
    url = "https://github.com/nodejs/gyp-next/commit/8224deef984add7e7afe846cfb82c9d3fa6da1fb.patch?full_index=1";
  in
  [
    (fetchpatch2 {
      inherit url;
      hash = "sha256-cXTwmCRHrNhuY1+3cD/EvU0CJ+1Nk4TRh6c3twvfaW8=";
      stripLen = 1;
      extraPrefix = "deps/npm/node_modules/node-gyp/gyp/";
    })
    (fetchpatch2 {
      inherit url;
      hash = "sha256-kvCMpedjrY64BlaC1R0NVjk/vIVivYAGVgWwMEGeP6k=";
      stripLen = 1;
      extraPrefix = "tools/gyp/";
    })
  ]
)
