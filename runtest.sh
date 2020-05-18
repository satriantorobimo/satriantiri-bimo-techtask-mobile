 if [[ -f "pubspec.yaml" ]]; then
        flutter test --coverage
        lcov -r coverage/lcov.info lib/resources/l10n/\* lib/rest/\*.dart lib/repo/\*.dart lib/screens/\* lib/model/\* lib/self_registration/screen/\* lib/widgets/\* -o coverage/lcov-final.info
        genhtml -o coverage coverage/lcov-final.info
        open coverage/index-sort-l.html
    else
        printf "\n${red}Error: this is not a Flutter project${none}"
        exit 1
    fi