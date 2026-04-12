#!/bin/bash

if [[ $# -ne 3 ]]; then
    echo "Использование: $0 <url_стенда> <браузер> <версия>"
    exit 1
fi

STAND_URL="$1"
BROWSER="$2"
BROWSER_VERSION="$3"
SELENIUM_HUB="http://localhost:4444/wd/hub"

echo " Запуск теста:"
echo "   Стенд: $STAND_URL"
echo "   Браузер: $BROWSER $BROWSER_VERSION"
echo "   Selenium Hub: $SELENIUM_HUB"

mvn test \
    -Dselenium.grid.url="$SELENIUM_HUB" \
    -Dtest.stand.url="$STAND_URL" \
    -Dbrowser.name="$BROWSER" \
    -Dbrowser.version="$BROWSER_VERSION" \
    -Dheadless=true

exit_code=$?

if [[ $exit_code -eq 0 ]]; then
    echo " Тесты прошли успешно"
else
    echo " Тесты упали с кодом: $exit_code"
fi

exit $exit_code
