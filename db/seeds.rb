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
                { body: '2004', correct?: true, question_id: 1 },
                { body: '2008', correct?: false, question_id: 1 },
                { body: '2001', correct?: false, question_id: 1 },
                # Answers to question 2
                { body: 'Von Januar bis September', correct?: false, question_id: 2 },
                { body: 'Von April bis August', correct?: false, question_id: 2 },
                { body: 'Von April bis Oktober', correct?: true, question_id: 2 },
              # Answers to question 3
                { body: 'Ja, bereits seit 2010', correct?: false, question_id: 3 },
                { body: 'Nein, der Antrag wurde bereits abgelehnt', correct?: false, question_id: 3 },
                { body: 'Nein, der Antrag wird noch gestellt', correct?: true, question_id: 3 },
              # Answers to question 4
                { body: '1. Äpfel ernten ' \
                        '2. Apfelsaft herstellen ' \
                        '3. Most stehen lassen ' \
                        '4. Gärung ' \
                        '5. Abfüllen und lagern', correct?: true, question_id: 4 },
                { body: '1. Äpfel pressen ' \
                        '2. Äpfel ernten ' \
                        '3. gären lassen ' \
                        '4. abfüllen', correct?: false, question_id: 4 },
                { body: '1. Most herstellen ' \
                        '2. abfüllen', correct?: false, question_id: 4 },
                # Answers to question 5
                { body: 'Der Viez wird zu Eiscreme weiterverarbeitet', correct?: false, question_id: 5 },
                { body: 'Die Äpfel werden bis zum ersten Frost hängen gelassen ' \
                        'und erst anschließend gekeltert', correct?: true, question_id: 5 },
                { body: 'Der Viez wird mit besonders vielen Eiswürfeln serviert', correct?: false, question_id: 5 },
                # Answers to question 6
                { body: 'Ein im 15. Jhd. in Trier gegründeter christlicher Mönchsorden,' \
                        'der bis heute  Viez auf traditionelle Weise herstellt', correct?: false, question_id: 6 },
                { body: 'Ein in Trier ansäßiger Vereien, der sich dem Erhalt und der Anerkennung ' \
                        'des Viez als Kulturgut  widmet', correct?: true, question_id: 6 },
                { body: 'Eine Gemeinschaft von Studenten, die sich regelmäßig zum Viez-Trinken in den ' \
                        'Trierer Kneipen trifft', correct?: false, question_id: 6 },
                # Answers to question 7
                { body: 'In einem Porzellanbecher, auch Viezporz genannt', correct?: true, question_id: 7 },
                { body: 'In einem Steinkrug, auch Viezkrug genannt', correct?: false, question_id: 7 },
                { body: 'In einem Glas, auch Viezglas genannt', correct?: false, question_id: 7 },
                # Answers to question 8
                { body: '1867 als Eintrag von Helena Demuth  im Poesiealbum von Jenny Marx unter dem ' \
                        'Punkt "Lieblingsgetränk"', correct?: false, question_id: 8 },
                { body: 'Auf Getränkerechnungen aus dem Jahr 1817 ', correct?: false, question_id: 8 },
                { body: 'Im 1834 veröffentlichten "Et Lied vom Viez" von Philipp Laven ',
                  correct?: true, question_id: 8 },
                # Answers to question 9
                { body: 'bis zu 300', correct?: false, question_id: 9 },
                { body: 'bis zu 3.000', correct?: true, question_id: 9 },
                { body: 'bis zu 10.000', correct?: false, question_id: 9 },
                # Answers to question 10
                { body: 'In der Gegend um Merzig', correct?: true, question_id: 10 },
                { body: 'In der Gegend um Trier', correct?: false, question_id: 10 },
                { body: 'In der Gegend um Wittlich', correct?: false, question_id: 10 }
              ])
#random facts about Viez that will be presented randomly if the user does not want to play the quiz
FunFact.create([
  { body: 'Wusstest Du, dass die gängige Abkürzung für Viez mit Cola Covie lautet?' },
  { body: 'Wusstest Du, dass sich unter den original Viezporzen der Aufdruck „GPS“ für Gebrüder Plein Speicher befindet?' },
  { body: 'Wusstest Du, dass in vielen Kneipen Viez gezapft wird? Es bedarf dafür jedoch eigens hergestellte Schläuche, da die Säure des Viez die handelsüblichen auflöst.' },
  { body: 'Wusstest Du, dass nicht überall der Viez aus einem Porz getrunken wird? Im Saarland reicht man das Getränk in einem Glaskrug.' },
  { body: 'Wusstest Du, dass man ca. 1,3kg Äpfel für einen Liter Viez benötigt?' },
  { body: 'Wusstest Du, dass es im Gegensatz zu vielen anderen traditionellen Getränken bei Viez keine Regeln gibt? Weder der Inhalt noch die Region in der das Getränk herstellt werden darf, ist begrenzt.' },
  { body: 'Wusstest Du, dass erst in den letzten 40 Jahren Viez wieder für viele Menschen rund um Trier attraktiv geworden ist? In der Mitte des letzten Jahrhundert galt es als verstaubtes Altherrengetränk und fand bei jüngeren Menschen kaum Beachtung.'},
  { body: 'Wusstest Du, dass es in der Gemeinde Igel im Ortsteil Liersberg eine Viezallee gibt? Sie hat ihren Namen bekommen, weil der damals zuständige örtliche Revierleiter scherzhaft ein Schild mit "Viezallee" dort angebracht hat und dort früher zahlreiche Obstbäume standen.'},
  { body: 'Wusstest Du, dass es in Hagenow einen Stadtteil namens Viez gibt?'},
])
