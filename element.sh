#!/bin/bash

# Check if argument is provided
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit 1
fi

# Connect to PostgreSQL and fetch element details
ELEMENT_INFO=$(psql --username=freecodecamp --dbname=periodic_table -t --no-align -c "
  SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius
  FROM elements
  INNER JOIN properties USING(atomic_number)
  INNER JOIN types USING(type_id)
  WHERE atomic_number = '$1' OR symbol = '$1' OR name = '$1';
")

# Check if element exists
if [[ -z $ELEMENT_INFO ]]; then
  echo "I could not find that element in the database."
else
  # Format and display the result
  IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING <<< "$ELEMENT_INFO"
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu."
  echo "$NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
fi
#!/bin/bash

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit 1
fi

echo "You entered: $1"
echo "Please provide an element as an argument."
#!/bin/bash

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit 1
fi
