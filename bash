könyvtár létezik ha igen milyen

#!/bin/bash

# Ellenőrizzük, hogy megadtak-e argumentumot
if [ "$#" -ne 1 ]; then
    echo "Használat: $0 <könyvtár>"
    exit 1
fi

# Ellenőrizzük, hogy az argumentum egy létező könyvtár-e
if [ ! -d "$1" ]; then
    echo "Hiba: $1 nem egy létező könyvtár!"
    exit 1
fi

# Kiírjuk az írható, de nem olvasható fájlokat
echo "Írható, de nem olvasható fájlok a(z) $1 könyvtárban:"
find "$1" -type f -perm -200 ! -perm -400 -print

exit 0

-------------------------------------------------- 
felhasználót keres


#!/bin/bash

# Ellenőrizzük, hogy megadtak-e felhasználónevet
if [ "$#" -ne 1 ]; then
    echo "Használat: $0 <felhasználónév>"
    exit 1
fi

USER_TO_CHECK="$1"
EMAIL_CÍM="te@pelda.com"

while true; do
    # Ellenőrizzük, hogy a felhasználó be van-e jelentkezve
    if who | grep -q "^$USER_TO_CHECK "; then
        TERMINAL=$(who | grep "^$USER_TO_CHECK " | awk '{print $2}')
        
        # Küldjünk értesítő e-mailt
        echo "A felhasználó $USER_TO_CHECK bejelentkezett. Terminál azonosítója: $TERMINAL" | mail -s "Bejelentkezési értesítés" "$EMAIL_CÍM"

        # A script leállítása a sikeres értesítés után (ha folyamatosan figyelni kell, akkor ezt távolítsuk el)
        exit 0
    fi

    # Várakozás fél percet
    sleep 30
done


# futttatás ./script3.sh username & 



------------------------------
#!/bin/bash

# Ellenőrizzük, hogy megadtak-e hivatkozást
if [ -z "$1" ]; then
    echo "Használat: $0 <hivatkozás>"
    exit 1
fi

# Ellenőrizzük, hogy létezik-e a hivatkozott állomány vagy könyvtár
if [ -e "$1" ]; then
    # Ha létezik, jelenítsük meg a részletes adatokat
    ls -ld "$1"
else
    echo "Nincs $1 nevű állomány!"
fi

# futtatás chmod +x vizsga.sh
#./vizsga.sh pelda_fajl.txt
--------------------------------------------


