#!/bin/bash
# endevina -- endevina un nombre entre 1 i 100 en 5 intents
NUMERO=$((RANDOM % 100 + 1))
INTENTS=5
INTENT=0

while [ $INTENT -lt $INTENTS ]; do
    read -p "Entra un nombre (1-100): " RESPOSTA
    INTENT=$((INTENT + 1))
    
    if [ "$RESPOSTA" -eq "$NUMERO" ]; then
        echo " Enhorabona! Has encertat en $INTENT intent(s)!"
        exit 0
    elif [ "$RESPOSTA" -lt "$NUMERO" ]; then
        echo " Massa petit! (et queden $((INTENTS - INTENT)) intents)"
    else
        echo " Massa gran! (et queden $((INTENTS - INTENT)) intents)"
    fi
done

# Ha esgotat els intents
echo "Has esgotat els $INTENTS intents. El nombre era $NUMERO."