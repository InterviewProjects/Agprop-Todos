# shellcheck disable=SC2028
# shellcheck disable=SC2164

echo '\n\n***************     Generating code for app starts    ***************'

cd data/
flutter pub get

cd ../domain/
flutter pub get
dart run build_runner build --delete-conflicting-outputs

cd ../
flutter pub get

echo '***************     Generating code for app ends    ***************'
