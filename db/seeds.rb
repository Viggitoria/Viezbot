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
                { body: '2004', correct?: true, belongs_to: 1 },
                { body: '2008', correct?: false, belongs_to: 1 },
                { body: '2001', correct?: false, belongs_to: 1 },
                # Answers to question 2
                { body: 'Von Januar bis September', correct?: false, belongs_to: 2 },
                { body: 'Von April bis August', correct?: false, belongs_to: 2 },
                { body: 'Von April bis Oktober', correct?: true, belongs_to: 2 },
              # Answers to question 3
                { body: 'Ja, bereits seit 2010', correct?: false, belongs_to: 3 },
                { body: 'Nein, der Antrag wurde bereits abgelehnt', correct?: false, belongs_to: 3 },
                { body: 'Nein, der Antrag wird noch gestellt', correct?: true, belongs_to: 3 },
              # Answers to question 4
                { body: '1. Äpfel ernten ' \
                        '2. Apfelsaft herstellen ' \
                        '3. Most stehen lassen ' \
                        '4. Gärung ' \
                        '5. Abfüllen und lagern', correct?: true, belongs_to: 4 },
                { body: '1. Äpfel pressen ' \
                        '2. Äpfel ernten ' \
                        '3. gären lassen ' \
                        '4. abfüllen', correct?: false, belongs_to: 4 },
                { body: '1. Most herstellen ' \
                        '2. abfüllen', correct?: false, belongs_to: 4 },
                # Answers to question 5
                { body: 'Der Viez wird zu Eiscreme weiterverarbeitet', correct?: false, belongs_to: 5 },
                { body: 'Die Äpfel werden bis zum ersten Frost hängen gelassen' \
                        'und erst anschließend gekeltert', correct?: true, belongs_to: 5 },
                { body: 'Der Viez wird mit besonders vielen Eiswürfeln serviert', correct?: false, belongs_to: 5 },
                # Answers to question 6
                { body: 'Ein im 15. Jhd. in Trier gegründeter christlicher Mönchsorden,' \
                        'der bis heute  Viez auf traditionelle Weise herstellt', correct?: false, belongs_to: 6 },
                { body: 'Ein in Trier ansäßiger Vereien, der sich dem Erhalt und der Anerkennung' \
                        'des Viez als Kulturgut  widmet', correct?: true, belongs_to: 6 },
                { body: 'Eine Gemeinschaft von Studenten, die sich regelmäßig zum Viez-Trinken in den' \
                        'Trierer Kneipen trifft.', correct?: false, belongs_to: 6 },
                # Answers to question 7
                { body: 'In einem Porzellanbecher, auch Viezporz genannt', correct?: true, belongs_to: 7 },
                { body: 'In einem Steinkrug, auch Viezkrug genannt', correct?: false, belongs_to: 7 },
                { body: 'In einem Glas, auch Viezglas genannt', correct?: false, belongs_to: 7 },
                # Answers to question 8
                { body: '1867 als Eintrag von Helena Demuth  im Poesiealbum von Jenny Marx unter dem' \
                        'Punkt "Lieblingsgetränk"', correct?: false, belongs_to: 8 },
                { body: 'Auf Getränkerechnungen aus dem Jahr 1817', correct?: false, belongs_to: 8 },
                { body: 'Im 1834 veröffentlichten "Et Lied vom Viez" von Philipp Laven ',
                  correct?: true, belongs_to: 8 },
                # Answers to question 9
                { body: 'bis zu 300', correct?: false, belongs_to: 9 },
                { body: 'bis zu 3.000', correct?: true, belongs_to: 9 },
                { body: 'bis zu 10.000', correct?: false, belongs_to: 9 },
                # Answers to question 10
                { body: 'In der Gegend um Merzig', correct?: true, belongs_to: 10 },
                { body: 'In der Gegend um Trier', correct?: false, belongs_to: 10 },
                { body: 'In der Gegend um Wittlich', correct?: false, belongs_to: 10 }
              ])
