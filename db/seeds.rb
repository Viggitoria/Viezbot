# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

Question.create([
                  { body: 'Wann wurde erstmalig ein Viezkönig gewählt?' },
                  { body: 'Kennst du die "Viezstraße"? Wie lang geht die Viezstraßen-Saison?' },
                  { body: 'Ist Viez bereits Teil des UNESCO Weltkulturerbes?' },
                  { body: 'Aus welchen Schritten besteht die Viez Herstellung?' },
                  { body: 'Wie entsteht Eis-Viez?' },
                  { body: 'Was ist die Viezbruderschaft?' },
                  { body: 'Wie wird Viez in der Moselregion traditionell serviert?' },
                  { body: 'Wo wurde das Wort "Viez" zum ersten Mal verschriftlicht?' },
                  { body: 'Bis zu wie viele verschiedene Tier- und Pflanzenarten beherbergen Streuobstwiesen?' },
                  { body: 'Wo liegt auch heute noch das Zentrum des Streuobstanbaus zwischen Mosel und Saar?' }
                ])

Answer.create([
                # Answers to question 1
                { body: '2004', correct?: true },
                { body: '2008', correct?: false },
                { body: '2001', correct?: false },
                # Answers to question 2
                { body: 'Von Januar bis September', correct?: false },
                { body: 'Von April bis August', correct?: false },
                { body: 'Von April bis Oktober', correct?: true },
              # Answers to question 3
                { body: 'Ja, bereits seit 2010', correct?: false },
                { body: 'Nein, der Antrag wurde bereits abgelehnt', correct?: false },
                { body: 'Nein, der Antrag wird noch gestellt', correct?: true },
              # Answers to question 4
                { body: '1. Äpfel ernten
                         2. Apfelsaft herstellen
                         3. Most stehen lassen
                         4. Gärung
                         5. Abfüllen und lagern', correct?: true },
                { body: '1. Äpfel pressen
                         2. Äpfel ernten
                         3. gären lassen
                         4. abfüllen', correct?: false },
                { body: '1. Most herstellen
                         2. abfüllen', correct?: false },
                # Answers to question 5
                { body: 'Der Viez wird zu Eiscreme weiterverarbeitet', correct?: false },
                { body: 'Die Äpfel werden bis zum ersten Frost hängen gelassen
                         und erst anschließend gekeltert', correct?: true },
                { body: 'Der Viez wird mit besonders vielen Eiswürfeln serviert', correct?: false },
                # Answers to question 6
                { body: 'Ein im 15. Jhd. in Trier gegründeter christlicher Mönchsorden,
                         der bis heute  Viez auf traditionelle Weise herstellt', correct?: false },
                { body: 'Ein in Trier ansäßiger Vereien, der sich dem Erhalt und der Anerkennung
                         des Viez als Kulturgut  widmet', correct?: true },
                { body: 'Eine Gemeinschaft von Studenten, die sich regelmäßig zum Viez-Trinken in den
                         Trierer Kneipen trifft.', correct?: false },
                # Answers to question 7
                { body: 'In einem Porzellanbecher, auch Viezporz genannt', correct?: true },
                { body: 'In einem Steinkrug, auch Viezkrug genannt', correct?: false },
                { body: 'In einem Glas, auch Viezglas genannt', correct?: false },
                # Answers to question 8
                { body: '1867 als Eintrag von Helena Demuth  im Poesiealbum von Jenny Marx unter dem
                         Punkt "Lieblingsgetränk"', correct?: false },
                { body: 'Auf Getränkerechnungen aus dem Jahr 1817', correct?: false },
                { body: 'Im 1834 veröffentlichten "Et Lied vom Viez" von Philipp Laven ', correct?: true },
                # Answers to question 9
                { body: 'bis zu 300', correct?: false },
                { body: 'bis zu 3.000', correct?: true },
                { body: 'bis zu 10.000', correct?: false },
                # Answers to question 10
                { body: 'In der Gegend um Merzig', correct?: true },
                { body: 'In der Gegend um Trier', correct?: false },
                { body: 'In der Gegend um Wittlich', correct?: false }
              ])
