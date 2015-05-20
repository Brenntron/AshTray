# AshTray

Ruby Capstone Project

## Project Vision

This is a small command line cigar review program. You can set options for
cigar length, ring size, type, contruction, and country of origin.

## Features

### Adding a new cigar

Add pleasurable cigars to a central list.

Usage Example:

  > ./ash_tray manage
  1. Add a cigar
  2. List cigars
  3. Edit a cigar
  4. Delete a cigar
  5. Exit
  > 1
  > Enter name
  > Mille Fleurs
  > Enter length
  > 5"
  > Enter ring gauge
  > 42
  > Enter maker
  > Romeo y Julieta
  > Select type
  > Petit Coronas
  > Select wrapper country of origin
  > Cuba
  > Select filler country of origin
  > Cuba
  > Select binder country of origini
  > Cuba
  > Enter rating (1-5)
  > 4
  1. Add a cigar
  2. List cigars
  3. Edit a cigar
  4. Delete a cigar
  5. Exit

Accaptence Criteria:

  * Program allows for entries
  * Returns to menu

### Editting an existing cigar for updating cigar reviews

Sometimes your taste for a particular cigar will change and you will
want to change you review accordingly.

Usage Example:

  > ./ash_tray manage
  1. Add a cigar
  2. List cigars
  3. Edit a cigar
  4. Delete a cigar
  5. Exit
  > 2
  1. Name: Mille Fleurs
  2. Length: 5"
  3. Ring Gauge: 42
  4. Maker: Romeo y Julieta
  5. Type: Petit Coronas
  6. Wrapper: Cuba
  7. Filler: Cuba
  8. Binder: Cuba
  9. Rating: 3
  > 9
  Enter rating
  > 3
  1. Add a cigar
  2. List cigars
  3. Edit a cigar
  4. Delete a cigar
  5. Exit

 Accaptence Criteria:

  * Program allows entries to be edited
  * Returns user to menu after editing the selection

### Deleting a cigar

And then somtimes you just want to forget about a cigar.

Usage Example:

  > ./ash_tray manage
  1. Add a cigar
  2. List cigars
  3. Edit a cigar
  4. Delete a cigar
  5. Exit
  > 3
  1. Mille Fleurs
  > 1
  1. Add a cigar
  2. List cigars
  3. Edit a cigar
  4. Delete a cigar
  5. Exit

Accapt

### Veiwing list of all cigars

Keep a list of all the cigars you have tried. Also maybe be a little
ashamed of all the money you have spent on them. Regret nothing.

Usage Example:

  > ./ash_tray manage
  1. Add a cigar
  2. List cigars
  3. Edit a cigar
  4. Delete a cigar
  5. Exit
  > 4
  1. Romeo y Julieta, Mille Fleurs, Wrapper: Cuba, Binder: Cuba,
     Filler: Cuba, Length: 5", Ring Gauge: 42, Shape: Petit Coronas,
     Rating: 3
  1. Add a cigar
  2. List cigars
  3. Edit a cigar
  4. Delete a cigar
  5. Exit


Accaptence Criteria:

  * Lists of cigars populates
  * Returns to menu after list populates
