import '../../Expo/exports.dart';

//app open ads
final String App_open_ads = 'ca-app-pub-7184732104842922/8971540219';
// rewarded ads
final String rewarded_ads = 'ca-app-pub-7184732104842922/4891064097';
// interstial ads
final String interstial_ads = 'ca-app-pub-7184732104842922/8779968520';
// banner ads
final String banner_ads = 'ca-app-pub-7184732104842922/1673287084';

const BorderRadius senderBorder = BorderRadius.only(
  topLeft: Radius.circular(10),
  topRight: Radius.circular(0),
  bottomLeft: Radius.circular(10),
  bottomRight: Radius.circular(10),
);

const BorderRadius receiverBorder = BorderRadius.only(
  topLeft: Radius.circular(0),
  topRight: Radius.circular(10),
  bottomLeft: Radius.circular(10),
  bottomRight: Radius.circular(10),
);

const String darkLogo = "assets/chatgpt_dark.png";
const String lightLogo = "assets/chatgpt_light.png";
const String apiKey = "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";

//
List<String> categories = [
  'Primo',
  'Secondo',
  'Contorno',
  'Panino',
  'Poke Bowl',
  'Dessert',
  'Insalatona',
];

final Map<String, String> defaultImages = {
  'poke bowl': 'assets/images/rec2.png',
  'contorno': 'assets/images/rec3.png',
  'insalatona': 'assets/images/rec5.png',
  'dessert': 'assets/images/rec6.png',
  'panino': 'assets/images/rec7.png',
  'primo': 'assets/images/rec8.png',
  'secondo': 'assets/images/rec9.png'
  // Add more images as needed
};
final List chipsimage = [
  'assets/images/rec8.png',
  'assets/images/rec9.png',
  'assets/images/rec3.png',
  'assets/images/rec7.png',
  'assets/images/rec2.png',
  'assets/images/rec6.png',
  'assets/images/rec5.png'
  // Add more images as needed
];
final List images = [
  'assets/images/diet1.png',
  'assets/images/diet2.png',
  'assets/images/diet3.png',
  'assets/images/diet4.png',
];
List<String> ditetype = ['Tutte', 'Onnivoro', 'Vegetariano', 'Vegano'];

const String dataProtectionText =
    '''

Introduzione\n
Con la seguente dichiarazione sulla protezione dei dati, desideriamo informarti sui
tipi di dati personali (di seguito anche “dati”) per quali scopi e in che misura. La
dichiarazione sulla protezione dei dati si applica a tutti i trattamenti di dati personali
che eseguiamo, entrambi nell’ambito di la fornitura dei nostri servizi, in particolare
sui nostri siti Web, nelle applicazioni mobili e all’interno di presenze online esterne,
come i nostri profili sui social media (di seguito denominati collettivamente “offerta
online”).\n
I termini utilizzati non sono specifici di genere.\n
Dal 08/02/2024\n
Titolare del Trattamento dei Dati\n
Diet Academy GbR con sede in Kreuzlinger str 12 78462 Konstanz – Germany\n
Indirizzo email del Titolare: info@dietacademy.org\n
Panoramica dell’elaborazione\n
La seguente panoramica sintetizza i tipi di dati trattati e le finalità del loro
trattamento e fa riferimento agli interessati.
Tipi di dati trattati\n
  ● Dati di inventario (ad esempio nomi e cognomi).
  ● Dettagli di contatto (ad es. E-mail, numeri di telefono).
  ● Dati meta / di comunicazione (ad es. Informazioni sul dispositivo, indirizzi IP).
  ● Dati di utilizzo (ad es. Siti Web visitati, interesse per i contenuti, tempi di
accesso).\n
Categorie di interessati\n
  ● Partner di comunicazione.
  ● Utenti (ad es. Visitatori del sito Web, utenti di servizi online).
Finalità del trattamento
  ● Richieste di contatto e comunicazione.\n
Basi legali pertinenti\n
Di seguito, condividiamo la base giuridica del Regolamento generale sulla protezione
dei dati (GDPR), sulla base del quale trattiamo i dati personali. Si noti che oltre alle
disposizioni del GDPR possono essere applicate le norme nazionali sulla protezione
dei dati nel proprio o nel nostro paese di residenza e domicilio. Qualora in singoli
casi si applichino anche basi legali più specifiche, vi informeremo nella dichiarazione
sulla protezione dei dati.\n
  ● Consenso (art. 6 cpv. 1 lett. 1 lett. A GDPR)  L’interessato ha dato il proprio
consenso al trattamento dei propri dati personali per uno scopo specifico o
diversi scopi specifici.
  ● Adempimento del contratto e indagini precontrattuali (Art. 6 Paragrafo 1 S. 1
lit. GDPR) – Il trattamento è necessario per l’adempimento di un contratto di
cui l’interessato è parte o per l’attuazione di misure precontrattuali su
richiesta dell’interessato fatto.
  ● Interessi legittimi (Art. 6 Par. 1 S. 1 lit. GDPR) – Il trattamento è necessario per
salvaguardare gli interessi legittimi della persona responsabile o di una terza
parte, a meno che gli interessi o i diritti e le libertà fondamentali
dell’interessato che proteggono i dati personali I dati richiedono, superano.\n
Misure di sicurezza\n
Adottiamo adeguate misure tecniche e organizzative in conformità con i requisiti
legali, tenendo conto dello stato dell’arte, dei costi di attuazione e del tipo, portata,
circostanze e scopi del trattamento, nonché della diversa probabilità di accadimento
e dell’entità della minaccia ai diritti e alle libertà delle persone fisiche assicurare un
livello di protezione adeguato al rischio.\n
Le misure comprendono, in particolare, la garanzia della riservatezza, dell’integrità e
della disponibilità dei dati controllando l’accesso fisico ed elettronico ai dati nonché
l’accesso, l’immissione, il trasferimento, la salvaguardia della disponibilità e la loro
separazione. Inoltre, abbiamo istituito procedure che garantiscono l’esercizio dei
diritti dell’interessato, la cancellazione dei dati e le reazioni al rischio per i dati.
Inoltre, prendiamo in considerazione la protezione dei dati personali durante lo
sviluppo o la selezione di hardware, software e processi basati sul principio della
protezione dei dati, attraverso la progettazione tecnologica e le impostazioni
predefinite compatibili con la protezione dei dati.\n
Trasmissione e diffusione di dati personali\n
Come parte del nostro trattamento di dati personali, può accadere che i dati vengano
trasmessi ad altri enti, società, unità organizzative o persone legalmente
indipendenti o che vengano divulgati a loro. I destinatari di questi dati possono
includere, ad esempio, istituti di pagamento nel contesto di transazioni di
pagamento, fornitori di servizi incaricati di attività IT o fornitori di servizi e contenuti
integrati in un sito Web. In tal caso, rispettiamo i requisiti legali e in particolare
stipuliamo contratti o accordi corrispondenti che servono a proteggere i tuoi dati con
i destinatari dei tuoi dati.\n
Elaborazione dei dati in paesi terzi\n
Se trattiamo dati in un paese terzo (ovvero al di fuori dell’Unione Europea (UE), dello
Spazio economico europeo (SEE)) o il trattamento come parte dell’uso di servizi di
terze parti o della divulgazione o trasmissione di dati ad altre persone, entità o
società avviene, ciò avviene solo in conformità con i requisiti legali.\n
Previo consenso espresso o trasmissione contrattualmente o legalmente richiesta,
trattiamo o consentiamo solo i dati in paesi terzi con un livello di protezione dei dati
riconosciuto, a cui appartengono i processori statunitensi certificati ai sensi dello
“Scudo per la privacy”, o sulla base di garanzie speciali, come un obbligo contrattuale
Elaborazione delle cosiddette clausole di protezione standard della Commissione
europea, esistenza di certificazioni o regolamenti interni vincolanti sulla protezione
dei dati (art. 44-49 GDPR, pagina informativa della Commissione UE:
https://ec.europa.eu/info/law/law-topic/data -protection /
international-dimension-data-protection_de ).\n
Uso dei cookie\n
I cookie sono file di testo che contengono dati da siti Web o domini visitati e
vengono salvati da un browser sul computer dell’utente. Lo scopo principale di un
cookie è di salvare informazioni su un utente durante o dopo la sua visita all’interno
di un’offerta online. Le informazioni memorizzate possono includere, ad esempio, le
impostazioni della lingua su un sito Web, lo stato di accesso, un carrello o il punto in
cui è stato visualizzato un video. Il termine cookie include anche altre tecnologie che
svolgono le stesse funzioni dei cookie (ad esempio, se le informazioni dell’utente
vengono archiviate utilizzando identificatori online pseudonimi, noti anche come “ID
utente”)\n
Viene fatta una distinzione tra i seguenti tipi di cookie e funzioni:\n
  ● Cookie temporanei (anche: cookie di sessione o di sessione): i cookie
temporanei vengono eliminati al più tardi dopo che un utente lascia un’offerta
online e chiude il suo browser.
  ● Cookie permanenti: i cookie permanenti rimangono salvati anche dopo la
chiusura del browser. Ad esempio, lo stato di accesso può essere salvato o il
contenuto preferito può essere visualizzato direttamente quando l’utente
visita nuovamente un sito Web. Gli interessi degli utenti che vengono utilizzati
per la misurazione della portata o per scopi di marketing possono anche
essere salvati in tale cookie.
  ● Cookie proprietari: i cookie proprietari sono impostati da noi.
  ● Cookie di terze parti (anche: cookie di terze parti) : i cookie di terze parti
vengono utilizzati principalmente dagli inserzionisti (le cosiddette terze parti)
per elaborare le informazioni degli utenti.
  ● Cookie necessari (anche: essenziali o assolutamente necessari): da un lato, i
cookie possono essere assolutamente necessari per il funzionamento di un
sito Web (ad esempio per salvare accessi o altre voci dell’utente o per motivi
di sicurezza).
  ● Cookie statistici, di marketing e di personalizzazione : inoltre, i cookie sono
generalmente utilizzati anche nell’ambito della misurazione della portata e
quando gli interessi di un utente o il suo comportamento (ad esempio la
visualizzazione di determinati contenuti, l’uso di funzioni ecc.) Su singoli siti
Web in un profilo utente essere salvato. Tali profili servono per mostrare agli
utenti, ad esempio, contenuti che corrispondono ai loro potenziali interessi.
Questo processo viene anche definito “tracciamento”, ovvero tracciamento dei
potenziali interessi degli utenti. , Nella misura in cui utilizziamo i cookie o le
tecnologie di “tracciamento”, ti informeremo separatamente nella nostra
dichiarazione sulla protezione dei dati o nel contesto dell’ottenimento del
consenso.\n
Note su basi legali: la base legale su cui trattiamo i tuoi dati personali con l’aiuto dei
cookie dipende dal fatto che ti chiediamo il tuo consenso. In questo caso e
acconsenti all’uso dei cookie, la base giuridica per il trattamento dei tuoi dati è il
consenso dichiarato. Altrimenti, i dati elaborati utilizzando i cookie verranno elaborati
in base ai nostri interessi legittimi (ad esempio in un’operazione commerciale della
nostra offerta online e del suo miglioramento) o, se l’uso dei cookie è necessario, per
adempiere ai nostri obblighi contrattuali.\n
Informazioni generali su revoca e opposizione (opt-out): a seconda che
l’elaborazione si basi sul consenso o sull’autorizzazione legale, hai la possibilità in
qualsiasi momento di revocare il tuo consenso o di opporti al trattamento dei tuoi
dati utilizzando le tecnologie dei cookie ( collettivamente denominato “opt-out”).
Puoi in primo luogo dichiarare la tua opposizione utilizzando le impostazioni del tuo
browser, ad esempio disattivando l’uso dei cookie (che può anche limitare la
funzionalità della nostra offerta online). Puoi anche opporti all’uso dei cookie per
scopi di marketing online utilizzando una varietà di servizi, in particolare in caso di
tracciamento, tramite il sito Web https://optout.aboutads.info e
https://www.youronlinechoices.com/ . Inoltre, è possibile ricevere ulteriori avvisi di
contraddizione nel contesto delle informazioni sui fornitori di servizi e sui cookie
utilizzati.\n
Elaborazione dei dati dei cookie in base al consenso : prima di elaborare o far
elaborare i dati nell’ambito dell’utilizzo dei cookie, chiediamo agli utenti il consenso
che può essere revocato in qualsiasi momento. Prima che il consenso non sia stato
fornito, vengono utilizzati i cookie necessari per il funzionamento della nostra offerta
online. Il loro utilizzo si basa sul nostro interesse e l’interesse degli utenti per le
funzionalità previste della nostra offerta online.
  ● Tipi di dati elaborati: dati di utilizzo (ad es. Siti Web visitati, interesse per i
contenuti, tempi di accesso), dati di meta / comunicazione (ad es.
Informazioni sul dispositivo, indirizzi IP).
  ● Persone interessate: utenti (ad esempio visitatori del sito Web, utenti di servizi
online).
  ● Base giuridica: consenso (art. 6 comma 1 clausola 1 a) GDPR), interessi
legittimi (art. 6 comma 1 clausola 1 lit. GDPR).\n
Fornitura dell’offerta online e web hosting\n
Per essere in grado di fornire la nostra offerta online in modo sicuro ed efficiente,
utilizziamo i servizi di uno o più provider di web hosting, dai cui server (o server
gestiti da essi) è possibile accedere all’offerta online. A tal fine, possiamo utilizzare
servizi di infrastruttura e piattaforma, capacità di elaborazione, spazio di
archiviazione e servizi di database, nonché servizi di sicurezza e di manutenzione
tecnica.\n
I dati elaborati nel contesto della fornitura dell’offerta di hosting possono includere
tutte le informazioni relative agli utenti della nostra offerta online sostenute nel
contesto dell’uso e della comunicazione. Ciò include regolarmente l’indirizzo IP
necessario per essere in grado di fornire il contenuto delle offerte online ai browser e
tutte le voci effettuate all’interno della nostra offerta online o dai siti Web.\n
Raccolta di dati di accesso e file di registro : noi stessi (o il nostro fornitore di web
hosting) raccogliamo dati su ogni accesso al server (i cosiddetti file di registro del
server). I file di registro del server possono includere l’indirizzo e il nome dei siti Web
e dei file a cui si accede, la data e l’ora dell’accesso, la quantità di dati trasferiti, la
notifica di accesso riuscito, il tipo e la versione del browser, il sistema operativo
dell’utente, l’URL di riferimento (la pagina precedentemente visitata) e, di norma, l’IP
Gli indirizzi e il provider richiedente appartengono.\n
I file di registro del server possono essere utilizzati da un lato per motivi di sicurezza,
ad esempio per evitare di sovraccaricare il server (soprattutto in caso di attacchi
abusivi, i cosiddetti attacchi DDoS) e, dall’altro lato, per garantire l’utilizzo dei server e
la loro stabilità.
  ● Tipi di dati trattati: dati di contenuto (ad es. Immissione di testo, fotografie,
video), dati di utilizzo (ad es. Siti Web visitati, interesse per i contenuti, tempi
di accesso), dati di meta / comunicazione (ad es. Informazioni sul dispositivo,
indirizzi IP).
  ● Persone interessate: utenti (ad esempio visitatori del sito Web, utenti di servizi
online).
  ● Base giuridica: interessi legittimi (Art. 6 Par. 1 S. 1 lit. GDPR).
Mettiti in contatto\n
Quando ci contatta (ad es. Tramite modulo di contatto, e-mail, telefono o social
media), vengono elaborati i dettagli degli interessati, nella misura in cui ciò sia
necessario per rispondere alle richieste di contatto e alle misure richieste.
La risposta alle richieste di contatto nell’ambito di relazioni contrattuali o
precontrattuali avviene per adempiere ai nostri obblighi contrattuali o per rispondere
a domande (pre) contrattuali e, inoltre, sulla base dei legittimi interessi nel
rispondere alle domande.\n
  ● Tipi di dati elaborati: dati di inventario (ad esempio nomi, indirizzi), dettagli di
contatto (ad esempio e-mail, numeri di telefono), dati di contenuto (ad
esempio immissione di testo, fotografie, video).
  ● Persone interessate: partner di comunicazione.
  ● Finalità del trattamento: richieste di contatto e comunicazione.
  ● Base giuridica: esecuzione del contratto e indagini precontrattuali (art. 6 cpv.
1 lett. 1 lett. GDPR), interessi legittimi (art. 6 cpv.1 1 lett. 1 lett. GDPR).\n
Cancellazione dei dati\n
I dati da noi trattati saranno cancellati in conformità con i requisiti legali non appena
il loro consenso al trattamento viene revocato o altre autorizzazioni non si applicano
più (ad esempio se lo scopo del trattamento di questi dati ha cessato di essere
applicato o se non è necessario allo scopo).\n
Se i dati non vengono cancellati perché richiesti per altri scopi e legalmente
consentiti, il loro trattamento è limitato a tali scopi. Ciò significa che i dati sono
bloccati e non elaborati per altri scopi. Ciò si applica, ad esempio, ai dati che devono
essere conservati per motivi commerciali o fiscali o la cui conservazione è
necessaria per far valere, esercitare o difendere azioni legali o per proteggere i diritti
di un’altra persona fisica o giuridica.\n
Ulteriori informazioni sulla cancellazione dei dati personali possono essere fornite
anche nel contesto delle singole informazioni sulla protezione dei dati contenute
nella presente dichiarazione sulla protezione dei dati.
Modifica e aggiornamento della dichiarazione sulla protezione dei dati
Vi chiediamo di informarvi regolarmente sul contenuto della nostra dichiarazione
sulla protezione dei dati. Adatteremo la dichiarazione sulla protezione dei dati non
appena le modifiche al trattamento dei dati da noi effettuate lo renderanno
necessario. Ti informeremo non appena un atto di cooperazione da parte tua (ad es.
Consenso) o altre notifiche individuali diventeranno necessarie a seguito delle
modifiche.\n
Se nella presente dichiarazione sulla protezione dei dati forniamo indirizzi e
informazioni di contatto di aziende e organizzazioni, si prega di notare che gli
indirizzi possono cambiare nel tempo e chiedervi di controllare le informazioni prima
di contattarci.\n
Diritti degli interessati\n
Come persona interessata, hai diversi diritti ai sensi del GDPR, che derivano in
particolare dagli articoli da 15 a 18 e 21 del GDPR:
  ● Diritto di opposizione: hai il diritto, per motivi derivanti dalla tua situazione
particolare, in qualsiasi momento contro il trattamento dei tuoi dati personali,
che si basa sull’articolo 6 capoverso 1 lett. eo f DSGVO ha luogo per opporsi;
ciò vale anche per la profilazione basata su queste disposizioni. Se i dati
personali che ti riguardano vengono elaborati per scopi di marketing diretto,
hai il diritto di opporti in qualsiasi momento al trattamento dei tuoi dati
personali ai fini di tale pubblicità; ciò vale anche per la profilazione nella
misura in cui è collegata a tale pubblicità diretta.
  ● Diritto di revoca del consenso: hai il diritto di revocare il tuo consenso in
qualsiasi momento.
  ● Diritto all’informazione: hai il diritto di richiedere la conferma del trattamento
dei dati in questione e di richiedere informazioni su tali dati nonché ulteriori
informazioni e una copia dei dati in conformità con i requisiti legali.
  ● Diritto alla correzione: in conformità con i requisiti legali, hai il diritto di
richiedere il completamento dei dati che ti riguardano o la correzione dei dati
errati che ti riguardano.
  ● Diritto alla cancellazione e limitazione del trattamento: in conformità con i
requisiti legali, hai il diritto di richiedere la cancellazione immediata dei dati
che ti riguardano o, in alternativa, di richiedere che il trattamento dei dati sia
limitato in conformità con i requisiti legali.
  ● Diritto alla portabilità dei dati: hai il diritto di ricevere dati relativi a te che ci hai
fornito in un formato strutturato, comune e leggibile da una macchina in
conformità con i requisiti legali, o di richiederne la trasmissione a un’altra
persona responsabile.
  ● Reclamo all’autorità di controllo: in conformità con i requisiti legali, hai anche
il diritto di presentare un reclamo a un’autorità di controllo, in particolare nello
Stato membro della tua residenza abituale, il tuo luogo di lavoro o il luogo
della presunta violazione, se ritieni che il trattamento dei tuoi dati influisca su
di te i dati personali violano il GDPR.\n
Definizioni dei termini\n
Questa sezione offre una panoramica dei termini utilizzati in questa dichiarazione
sulla protezione dei dati. Molti dei termini sono tratti dalla legge e definiti
principalmente nell’articolo 4 GDPR. Le definizioni legali sono vincolanti. Le seguenti
spiegazioni, d’altra parte, sono intese principalmente per la comprensione. I termini
sono ordinati alfabeticamente.
  ● Dati personali: “Dati personali” sono tutte le informazioni relative a una
persona fisica identificata o identificabile (di seguito “soggetto dei dati”); Una
persona identificabile è una persona fisica che può essere identificata
direttamente o indirettamente, in particolare assegnando un identificatore
come un nome, un numero di identificazione, i dati sulla posizione, un
identificatore online (ad esempio cookie) o una o più funzioni speciali,
esprimere l’identità fisica, fisiologica, genetica, psicologica, economica,
culturale o sociale di questa persona fisica.
  ● Responsabile: il “responsabile” è la persona fisica o giuridica, l’autorità
pubblica, l’agenzia o altro ente che, da solo o insieme ad altri, decide sulle
finalità e sui mezzi di trattamento dei dati personali.
  ● Elaborazione: “elaborazione” è qualsiasi processo eseguito con o senza
l’ausilio di processi automatizzati o di tali serie di processi in connessione con
dati personali. Il termine va molto lontano e copre praticamente ogni
trattamento di dati, che si tratti di raccogliere, valutare, archiviare, trasmettere
o eliminare.
  ''';
const String Appdata =
    '''
PiattoPronto rappresenta un'avanguardia nel mondo delle applicazioni culinarie, distaccandosi
dalle tradizionali app di ricette grazie all'impiego dell'intelligenza artificiale (AI). Sviluppata per
servire da fonte di ispirazione culinaria, offre agli utenti suggerimenti personalizzati che si
adattano alle loro preferenze alimentari, bisogni nutrizionali e agli ingredienti disponibili in casa.
Questo approccio non solo aiuta a variare la dieta quotidiana con nuove idee e sapori, ma
incoraggia anche un approccio più consapevole e sostenibile all'alimentazione.\n
Un elemento distintivo di PiattoPronto è il suo impegno verso la sostenibilità e la riduzione degli
sprechi alimentari. L'applicazione è progettata per suggerire ricette che utilizzino al meglio gli
ingredienti già presenti in dispensa, riducendo così la necessità di acquisti supplementari e
minimizzando gli avanzi. Questa caratteristica risponde all'esigenza crescente di adottare
pratiche di consumo più responsabili, in linea con gli obiettivi globali di sostenibilità.\n
La piattaforma di PiattoPronto si basa su un sofisticato algoritmo di AI che apprende dalle
preferenze e dalle abitudini alimentari degli utenti, offrendo ricette sempre più accurate e in
sintonia con i gusti personali. L'integrazione di questa tecnologia non solo rende l'esperienza
utente più fluida e intuitiva, ma permette anche di esplorare nuove combinazioni di ingredienti e
di scoprire ricette tradizionali provenienti da culture diverse, arricchendo il repertorio culinario
personale.\n
In conclusione, PiattoPronto si propone come un compagno culinario intelligente, che combina il
piacere della scoperta gastronomica con la consapevolezza ambientale. Attraverso l'utilizzo
dell'AI, l'applicazione mira a trasformare il modo in cui pensiamo al cibo, promuovendo una
cucina creativa, personalizzata e rispettosa del pianeta
 ''';
const String Disclaimer =
    ''' 
Importante: Prima di utilizzare l'applicazione PiattoPronto, leggere attentamente il
seguente disclaimer.\n
PiattoPronto è un'applicazione di creazione ricette alimentata da intelligenza
artificiale (AI), sviluppata con l'intento di offrire ispirazione culinaria e suggerimenti
personalizzati per gli utenti. Nonostante l'impegno profuso nella progettazione di
un'esperienza utente positiva e informativa, Diet Academy GbR e tutte le parti
coinvolte nella creazione, sviluppo e gestione di PiattoPronto (di seguito
collettivamente denominati "i Proprietari") non si assumono alcuna responsabilità
per intolleranze alimentari, allergie, o qualsiasi altro problema di salute o danni che
possano derivare direttamente o indirettamente dall'utilizzo delle informazioni, dei
contenuti e delle ricette fornite dall'applicazione.\n
Assunzione di Rischi e Responsabilità:\n
Utilizzando PiattoPronto, l'utente riconosce e accetta che la preparazione di ricette e
l'utilizzo delle informazioni fornite avvengono sotto la propria esclusiva
responsabilità. L'utente si impegna a valutare autonomamente l'adeguatezza
nutrizionale, la presenza di potenziali allergeni e la sicurezza delle ricette proposte.\n
Esonero da Responsabilità:\n
L'utente accetta di sollevare e mantenere indenni i Proprietari da qualsiasi reclamo,
danno, responsabilità, costo, perdita e spesa (inclusi ma non limitati a onorari legali)
che possano scaturire dall'utilizzo delle informazioni, dei contenuti e delle ricette
presenti su PiattoPronto. Questo esonero include, senza limitazioni, qualsiasi
conseguenza relativa a intolleranze alimentari, allergie, effetti collaterali o qualsiasi
altro danno alla salute.\n
Nessuna Garanzia:\n
I Proprietari non forniscono alcuna garanzia sull'accuratezza, l'affidabilità o la
completezza delle informazioni, dei contenuti o delle ricette fornite da PiattoPronto e
declinano espressamente qualsiasi garanzia, espressa o implicita, a tal riguardo.\n
Modifiche e Aggiornamenti:\n
I Proprietari si riservano il diritto di modificare o aggiornare il presente disclaimer in
qualsiasi momento senza preavviso. L'utilizzo continuato dell'applicazione
PiattoPronto da parte dell'utente dopo tali modifiche costituirà accettazione dei
nuovi termini.\n
Utilizzando PiattoPronto, l'utente conferma di aver letto, compreso e accettato i
termini di questo disclaimer.\n

''';
