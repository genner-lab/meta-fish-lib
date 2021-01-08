Reference library coverage report
================
Rupert A. Collins
08 January 2021

##### Methods and description

This document describes the contents of the UK fish reference library, generated from public databases. The document is a dynamic knitr document and can be updated quickly using the Makefile in `scripts/`. A list of species from the UK was generated from three sources: GBIF, FishBase, and the Water Framework Directive list of transitional species. This list was filtered to identify synonyms and duplicates, and annotated with FishBase taxonomic classification and FishBase common names. Next a sub-list of "common" species was generated. These were species that we believe are likely to be encountered in eDNA surveys of inshore and transitional waters of the UK, and comprise most of the species in Henderson (2015). Most of the remaining are either introduced species, rarely encountered migrants, oceanic pelagics, or deep sea organisms.

The search was performed on the GenBank nt and BOLD sequences databases. Because of inconsistencies in how researchers annotate their GenBank submissions and the differing internal coverage of primer pairs for particular gene fragments, we performed a search requesting all mitochondrial DNA. Then we pulled out fragments of interest using a hidden markov model. This enabled us to have greater confidence that useful sequences had not been missed. For the resulting sequences we then tabulated all their metadata from GenBank in order to allow us the capability to curate a custom reference library according to various criteria (e.g. must have reference specimen or locality data).

##### Results

The total number of UK species is estimated to be around 530. GenBank and BOLD were searched on 08 Jan 2021 (GenBank version 241). A total of 45 records were recovered. Combined with the GenBank sequence data, 2% of the 176 common species have been sampled (Table 2), and 3% of the 354 rare species (Table 3). For the common species, the median number of GenBank sequences per species is 0, while 0 (0%) are represented by only one tissue or sequence. Table 1 lists the common species currently missing from reference library, i.e. those of highest priority to source.

###### Table 2. All common UK species with counts for sequence data obtained from GenBank (number of individuals).

| Family          | Scientific Name                | Common Name              |  GenBank Count|
|:----------------|:-------------------------------|:-------------------------|--------------:|
| Anguillidae     | *Anguilla anguilla*            | European eel             |               |
| Congridae       | *Conger conger*                | European conger          |               |
| Atherinidae     | *Atherina boyeri*              | Big-scale sand smelt     |               |
| Belonidae       | *Belone belone*                | Garfish                  |               |
| Clupeidae       | *Alosa alosa*                  | Allis shad               |               |
| Clupeidae       | *Alosa fallax*                 | Twaite shad              |               |
| Clupeidae       | *Clupea harengus*              | Atlantic herring         |               |
| Clupeidae       | *Sardina pilchardus*           | European pilchard        |               |
| Clupeidae       | *Sprattus sprattus*            | European sprat           |              3|
| Engraulidae     | *Engraulis encrasicolus*       | European anchovy         |               |
| Cobitidae       | *Cobitis taenia*               | Spined loach             |               |
| Cyprinidae      | *Abramis brama*                | Freshwater bream         |               |
| Cyprinidae      | *Alburnus alburnus*            | Bleak                    |               |
| Cyprinidae      | *Barbus barbus*                | Barbel                   |               |
| Cyprinidae      | *Blicca bjoerkna*              | White bream              |               |
| Cyprinidae      | *Carassius auratus*            | Goldfish                 |               |
| Cyprinidae      | *Carassius carassius*          | Crucian carp             |               |
| Cyprinidae      | *Cyprinus carpio*              | Common carp              |               |
| Cyprinidae      | *Gobio gobio*                  | Gudgeon                  |               |
| Cyprinidae      | *Leuciscus idus*               | Ide                      |               |
| Cyprinidae      | *Leuciscus leuciscus*          | Common dace              |               |
| Cyprinidae      | *Phoxinus phoxinus*            | Eurasian minnow          |               |
| Cyprinidae      | *Pseudorasbora parva*          | Stone moroko             |               |
| Cyprinidae      | *Rutilus rutilus*              | Roach                    |               |
| Cyprinidae      | *Scardinius erythrophthalmus*  | Rudd                     |               |
| Cyprinidae      | *Squalius cephalus*            | Chub                     |               |
| Cyprinidae      | *Tinca tinca*                  | Tench                    |               |
| Nemacheilidae   | *Barbatula barbatula*          | Stone loach              |               |
| Esocidae        | *Esox lucius*                  | Northern pike            |               |
| Gadidae         | *Gadiculus argenteus*          | Silvery pout             |               |
| Gadidae         | *Gadus morhua*                 | Atlantic cod             |               |
| Gadidae         | *Melanogrammus aeglefinus*     | Haddock                  |               |
| Gadidae         | *Merlangius merlangus*         | Whiting                  |               |
| Gadidae         | *Micromesistius poutassou*     | Blue whiting             |               |
| Gadidae         | *Pollachius pollachius*        | Pollack                  |               |
| Gadidae         | *Pollachius virens*            | Saithe                   |               |
| Gadidae         | *Raniceps raninus*             | Tadpole fish             |               |
| Gadidae         | *Trisopterus esmarkii*         | Norway pout              |               |
| Gadidae         | *Trisopterus luscus*           | Pouting                  |               |
| Gadidae         | *Trisopterus minutus*          | Poor cod                 |               |
| Lotidae         | *Ciliata mustela*              | Fivebeard rockling       |               |
| Lotidae         | *Ciliata septentrionalis*      | Northern rockling        |               |
| Lotidae         | *Enchelyopus cimbrius*         | Fourbeard rockling       |               |
| Lotidae         | *Gaidropsarus mediterraneus*   | Shore rockling           |               |
| Lotidae         | *Gaidropsarus vulgaris*        | Three-bearded rockling   |               |
| Lotidae         | *Molva molva*                  | Ling                     |               |
| Merlucciidae    | *Merluccius merluccius*        | European hake            |               |
| Gasterosteidae  | *Gasterosteus aculeatus*       | Three-spined stickleback |               |
| Gasterosteidae  | *Pungitius pungitius*          | Ninespine stickleback    |               |
| Gasterosteidae  | *Spinachia spinachia*          | Sea stickleback          |               |
| Gobiesocidae    | *Apletodon dentatus*           | Small-headed clingfish   |               |
| Gobiesocidae    | *Diplecogaster bimaculata*     | Two-spotted clingfish    |               |
| Gobiesocidae    | *Lepadogaster candolii*        | Connemarra clingfish     |               |
| Gobiesocidae    | *Lepadogaster purpurea*        | Cornish sucker           |               |
| Lophiidae       | *Lophius piscatorius*          | Angler                   |               |
| Mugilidae       | *Chelon auratus*               | Golden grey mullet       |               |
| Mugilidae       | *Chelon labrosus*              | Thicklip grey mullet     |               |
| Mugilidae       | *Chelon ramada*                | Thinlip grey mullet      |               |
| Osmeridae       | *Osmerus eperlanus*            | European smelt           |               |
| Ammodytidae     | *Ammodytes marinus*            | Lesser sand-eel          |               |
| Ammodytidae     | *Ammodytes tobianus*           | Small sandeel            |               |
| Ammodytidae     | *Gymnammodytes semisquamatus*  | Smooth sandeel           |               |
| Ammodytidae     | *Hyperoplus immaculatus*       | Greater sand-eel         |               |
| Ammodytidae     | *Hyperoplus lanceolatus*       | Great sandeel            |               |
| Anarhichadidae  | *Anarhichas lupus*             | Atlantic wolffish        |               |
| Blenniidae      | *Blennius ocellaris*           | Butterfly blenny         |               |
| Blenniidae      | *Coryphoblennius galerita*     | Montagu's blenny         |               |
| Blenniidae      | *Lipophrys pholis*             | Shanny                   |               |
| Blenniidae      | *Parablennius gattorugine*     | Tompot blenny            |               |
| Callionymidae   | *Callionymus lyra*             | Dragonet                 |               |
| Callionymidae   | *Callionymus maculatus*        |                          |               |
| Callionymidae   | *Callionymus reticulatus*      | Reticulated dragonet     |               |
| Caproidae       | *Capros aper*                  | Boarfish                 |               |
| Carangidae      | *Trachurus trachurus*          | Atlantic horse mackerel  |               |
| Cepolidae       | *Cepola macrophthalma*         | Red bandfish             |               |
| Gobiidae        | *Aphia minuta*                 | Transparent goby         |               |
| Gobiidae        | *Crystallogobius linearis*     | Crystal goby             |               |
| Gobiidae        | *Gobius cobitis*               | Giant goby               |               |
| Gobiidae        | *Gobiusculus flavescens*       | Two-spotted goby         |               |
| Gobiidae        | *Gobius niger*                 | Black goby               |               |
| Gobiidae        | *Gobius paganellus*            | Rock goby                |               |
| Gobiidae        | *Lesueurigobius friesii*       | Fries's goby             |               |
| Gobiidae        | *Pomatoschistus lozanoi*       | Lozano's goby            |               |
| Gobiidae        | *Pomatoschistus microps*       | Common goby              |               |
| Gobiidae        | *Pomatoschistus minutus*       | Sand goby                |               |
| Gobiidae        | *Pomatoschistus norvegicus*    | Norway goby              |               |
| Gobiidae        | *Pomatoschistus pictus*        | Painted goby             |               |
| Gobiidae        | *Thorogobius ephippiatus*      | Leopard-spotted goby     |               |
| Labridae        | *Centrolabrus exoletus*        | Rock cook                |               |
| Labridae        | *Ctenolabrus rupestris*        | Goldsinny-wrasse         |               |
| Labridae        | *Labrus bergylta*              | Ballan wrasse            |               |
| Labridae        | *Labrus mixtus*                | Cuckoo wrasse            |               |
| Labridae        | *Symphodus bailloni*           | Baillon's wrasse         |               |
| Labridae        | *Symphodus melops*             | Corkwing wrasse          |               |
| Moronidae       | *Dicentrarchus labrax*         | European seabass         |               |
| Mullidae        | *Mullus surmuletus*            | Surmullet                |               |
| Percidae        | *Gymnocephalus cernua*         | Ruffe                    |               |
| Percidae        | *Perca fluviatilis*            | European perch           |               |
| Percidae        | *Sander lucioperca*            | Pike-perch               |              2|
| Pholidae        | *Pholis gunnellus*             | Rock gunnel              |               |
| Scombridae      | *Scomber scombrus*             | Atlantic mackerel        |               |
| Sparidae        | *Pagellus bogaraveo*           | Blackspot seabream       |               |
| Sparidae        | *Pagrus pagrus*                | Red porgy                |               |
| Sparidae        | *Sparus aurata*                | Gilthead seabream        |               |
| Sparidae        | *Spondyliosoma cantharus*      | Black seabream           |               |
| Stichaeidae     | *Chirolophis ascanii*          | Yarrell's blenny         |               |
| Stichaeidae     | *Lumpenus lampretaeformis*     | Snakeblenny              |               |
| Trachinidae     | *Echiichthys vipera*           | Lesser weever            |               |
| Trachinidae     | *Trachinus draco*              | Greater weever           |               |
| Zoarcidae       | *Zoarces viviparus*            | Eelpout                  |               |
| Bothidae        | *Arnoglossus laterna*          | Mediterranean scaldfish  |               |
| Pleuronectidae  | *Glyptocephalus cynoglossus*   | Witch flounder           |               |
| Pleuronectidae  | *Hippoglossoides platessoides* | American plaice          |               |
| Pleuronectidae  | *Hippoglossus hippoglossus*    | Atlantic halibut         |               |
| Pleuronectidae  | *Limanda limanda*              | Common dab               |               |
| Pleuronectidae  | *Microstomus kitt*             | Lemon sole               |               |
| Pleuronectidae  | *Platichthys flesus*           | European flounder        |               |
| Pleuronectidae  | *Pleuronectes platessa*        | European plaice          |               |
| Scophthalmidae  | *Lepidorhombus whiffiagonis*   | Megrim                   |               |
| Scophthalmidae  | *Phrynorhombus norvegicus*     | Norwegian topknot        |               |
| Scophthalmidae  | *Scophthalmus maximus*         | Turbot                   |               |
| Scophthalmidae  | *Scophthalmus rhombus*         | Brill                    |               |
| Scophthalmidae  | *Zeugopterus punctatus*        | Topknot                  |               |
| Scophthalmidae  | *Zeugopterus regius*           | Eckstr<f6>m's topknot    |               |
| Soleidae        | *Buglossidium luteum*          | Solenette                |               |
| Soleidae        | *Microchirus variegatus*       | Thickback sole           |               |
| Soleidae        | *Pegusa lascaris*              | Sand sole                |               |
| Soleidae        | *Solea solea*                  | Common sole              |               |
| Salmonidae      | *Oncorhynchus mykiss*          | Rainbow trout            |             19|
| Salmonidae      | *Salmo salar*                  | Atlantic salmon          |               |
| Salmonidae      | *Salmo trutta*                 | Sea trout                |               |
| Salmonidae      | *Thymallus thymallus*          | Grayling                 |               |
| Agonidae        | *Agonus cataphractus*          | Hooknose                 |               |
| Cottidae        | *Cottus gobio*                 | Bullhead                 |               |
| Cottidae        | *Micrenophrys lilljeborgii*    | Norway bullhead          |               |
| Cottidae        | *Myoxocephalus scorpius*       | Shorthorn sculpin        |              3|
| Cottidae        | *Taurulus bubalis*             | Longspined bullhead      |               |
| Cyclopteridae   | *Cyclopterus lumpus*           | Lumpfish                 |               |
| Liparidae       | *Liparis liparis*              | Striped seasnail         |               |
| Liparidae       | *Liparis montagui*             | Montagus seasnail        |               |
| Triglidae       | *Chelidonichthys cuculus*      | Red gurnard              |               |
| Triglidae       | *Chelidonichthys lastoviza*    | Streaked gurnard         |               |
| Triglidae       | *Chelidonichthys lucerna*      | Tub gurnard              |               |
| Triglidae       | *Eutrigla gurnardus*           | Grey gurnard             |               |
| Siluridae       | *Silurus glanis*               | Wels catfish             |               |
| Syngnathidae    | *Entelurus aequoreus*          | Snake pipefish           |               |
| Syngnathidae    | *Hippocampus guttulatus*       | Long-snouted seahorse    |               |
| Syngnathidae    | *Hippocampus hippocampus*      | Short snouted seahorse   |               |
| Syngnathidae    | *Nerophis lumbriciformis*      | Worm pipefish            |               |
| Syngnathidae    | *Nerophis ophidion*            | Straightnose pipefish    |               |
| Syngnathidae    | *Syngnathus acus*              | Greater pipefish         |               |
| Syngnathidae    | *Syngnathus rostellatus*       | Nilsson's pipefish       |               |
| Syngnathidae    | *Syngnathus typhle*            | Broadnosed pipefish      |               |
| Balistidae      | *Balistes capriscus*           | Grey triggerfish         |               |
| Molidae         | *Mola mola*                    | Ocean sunfish            |               |
| Zeidae          | *Zeus faber*                   | John dory                |               |
| Petromyzontidae | *Lampetra fluviatilis*         | River lamprey            |               |
| Petromyzontidae | *Lampetra planeri*             | European brook lamprey   |               |
| Petromyzontidae | *Petromyzon marinus*           | Sea lamprey              |               |
| Carcharhinidae  | *Prionace glauca*              | Blue shark               |               |
| Scyliorhinidae  | *Scyliorhinus canicula*        | Lesser spotted dogfish   |               |
| Scyliorhinidae  | *Scyliorhinus stellaris*       | Nursehound               |               |
| Triakidae       | *Galeorhinus galeus*           | Tope shark               |               |
| Triakidae       | *Mustelus asterias*            | Starry smooth-hound      |               |
| Alopiidae       | *Alopias vulpinus*             | Thresher                 |               |
| Cetorhinidae    | *Cetorhinus maximus*           | Basking shark            |               |
| Lamnidae        | *Lamna nasus*                  | Porbeagle                |               |
| Dasyatidae      | *Dasyatis pastinaca*           | Common stingray          |               |
| Rajidae         | *Amblyraja radiata*            | Starry ray               |               |
| Rajidae         | *Leucoraja naevus*             | Cuckoo ray               |               |
| Rajidae         | *Raja brachyura*               | Blonde ray               |               |
| Rajidae         | *Raja clavata*                 | Thornback ray            |               |
| Rajidae         | *Raja microocellata*           | Small-eyed ray           |               |
| Rajidae         | *Raja montagui*                | Spotted ray              |               |
| Rajidae         | *Raja undulata*                | Undulate ray             |               |
| Squalidae       | *Squalus acanthias*            | Picked dogfish           |               |

###### Table 3. Big table

<table>
<colgroup>
<col width="9%" />
<col width="18%" />
<col width="14%" />
<col width="5%" />
<col width="5%" />
<col width="7%" />
<col width="8%" />
<col width="6%" />
<col width="7%" />
<col width="5%" />
<col width="8%" />
<col width="2%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Family</th>
<th align="left">Scientific Name</th>
<th align="left">Common Name</th>
<th align="right">12s.miya</th>
<th align="right">12s.riaz</th>
<th align="right">12s.taberlet</th>
<th align="right">12s.valentini</th>
<th align="right">16s.berry</th>
<th align="right">coi.lerayxt</th>
<th align="right">coi.ward</th>
<th align="right">cytb.minamoto</th>
<th align="right">NA</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Anguillidae</td>
<td align="left"><em>Anguilla anguilla</em></td>
<td align="left">European eel</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">54</td>
<td align="right">54</td>
<td align="right">0</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">Congridae</td>
<td align="left"><em>Conger conger</em></td>
<td align="left">European conger</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">28</td>
<td align="right">28</td>
<td align="right">0</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">Atherinidae</td>
<td align="left"><em>Atherina boyeri</em></td>
<td align="left">Big-scale sand smelt</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">23</td>
<td align="right">23</td>
<td align="right">0</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">Belonidae</td>
<td align="left"><em>Belone belone</em></td>
<td align="left">Garfish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">29</td>
<td align="right">29</td>
<td align="right">0</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">Clupeidae</td>
<td align="left"><em>Alosa alosa</em></td>
<td align="left">Allis shad</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Clupeidae</td>
<td align="left"><em>Alosa fallax</em></td>
<td align="left">Twaite shad</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Clupeidae</td>
<td align="left"><em>Clupea harengus</em></td>
<td align="left">Atlantic herring</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Clupeidae</td>
<td align="left"><em>Sardina pilchardus</em></td>
<td align="left">European pilchard</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Clupeidae</td>
<td align="left"><em>Sprattus sprattus</em></td>
<td align="left">European sprat</td>
<td align="right">3</td>
<td align="right">3</td>
<td align="right">3</td>
<td align="right">3</td>
<td align="right">9</td>
<td align="right">3</td>
<td align="right">3</td>
<td align="right">3</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">Engraulidae</td>
<td align="left"><em>Engraulis encrasicolus</em></td>
<td align="left">European anchovy</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Cobitidae</td>
<td align="left"><em>Cobitis taenia</em></td>
<td align="left">Spined loach</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Cyprinidae</td>
<td align="left"><em>Abramis brama</em></td>
<td align="left">Freshwater bream</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Cyprinidae</td>
<td align="left"><em>Alburnus alburnus</em></td>
<td align="left">Bleak</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Cyprinidae</td>
<td align="left"><em>Barbus barbus</em></td>
<td align="left">Barbel</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Cyprinidae</td>
<td align="left"><em>Blicca bjoerkna</em></td>
<td align="left">White bream</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Cyprinidae</td>
<td align="left"><em>Carassius auratus</em></td>
<td align="left">Goldfish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Cyprinidae</td>
<td align="left"><em>Carassius carassius</em></td>
<td align="left">Crucian carp</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Cyprinidae</td>
<td align="left"><em>Cyprinus carpio</em></td>
<td align="left">Common carp</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Cyprinidae</td>
<td align="left"><em>Gobio gobio</em></td>
<td align="left">Gudgeon</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Cyprinidae</td>
<td align="left"><em>Leuciscus idus</em></td>
<td align="left">Ide</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Cyprinidae</td>
<td align="left"><em>Leuciscus leuciscus</em></td>
<td align="left">Common dace</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Cyprinidae</td>
<td align="left"><em>Phoxinus phoxinus</em></td>
<td align="left">Eurasian minnow</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Cyprinidae</td>
<td align="left"><em>Pseudorasbora parva</em></td>
<td align="left">Stone moroko</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Cyprinidae</td>
<td align="left"><em>Rutilus rutilus</em></td>
<td align="left">Roach</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Cyprinidae</td>
<td align="left"><em>Scardinius erythrophthalmus</em></td>
<td align="left">Rudd</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Cyprinidae</td>
<td align="left"><em>Squalius cephalus</em></td>
<td align="left">Chub</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Cyprinidae</td>
<td align="left"><em>Tinca tinca</em></td>
<td align="left">Tench</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Nemacheilidae</td>
<td align="left"><em>Barbatula barbatula</em></td>
<td align="left">Stone loach</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Esocidae</td>
<td align="left"><em>Esox lucius</em></td>
<td align="left">Northern pike</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gadidae</td>
<td align="left"><em>Gadiculus argenteus</em></td>
<td align="left">Silvery pout</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Gadidae</td>
<td align="left"><em>Gadus morhua</em></td>
<td align="left">Atlantic cod</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gadidae</td>
<td align="left"><em>Melanogrammus aeglefinus</em></td>
<td align="left">Haddock</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Gadidae</td>
<td align="left"><em>Merlangius merlangus</em></td>
<td align="left">Whiting</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gadidae</td>
<td align="left"><em>Micromesistius poutassou</em></td>
<td align="left">Blue whiting</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Gadidae</td>
<td align="left"><em>Pollachius pollachius</em></td>
<td align="left">Pollack</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gadidae</td>
<td align="left"><em>Pollachius virens</em></td>
<td align="left">Saithe</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Gadidae</td>
<td align="left"><em>Raniceps raninus</em></td>
<td align="left">Tadpole fish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gadidae</td>
<td align="left"><em>Trisopterus esmarkii</em></td>
<td align="left">Norway pout</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Gadidae</td>
<td align="left"><em>Trisopterus luscus</em></td>
<td align="left">Pouting</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gadidae</td>
<td align="left"><em>Trisopterus minutus</em></td>
<td align="left">Poor cod</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Lotidae</td>
<td align="left"><em>Ciliata mustela</em></td>
<td align="left">Fivebeard rockling</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Lotidae</td>
<td align="left"><em>Ciliata septentrionalis</em></td>
<td align="left">Northern rockling</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Lotidae</td>
<td align="left"><em>Enchelyopus cimbrius</em></td>
<td align="left">Fourbeard rockling</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Lotidae</td>
<td align="left"><em>Gaidropsarus mediterraneus</em></td>
<td align="left">Shore rockling</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Lotidae</td>
<td align="left"><em>Gaidropsarus vulgaris</em></td>
<td align="left">Three-bearded rockling</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Lotidae</td>
<td align="left"><em>Molva molva</em></td>
<td align="left">Ling</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Merlucciidae</td>
<td align="left"><em>Merluccius merluccius</em></td>
<td align="left">European hake</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gasterosteidae</td>
<td align="left"><em>Gasterosteus aculeatus</em></td>
<td align="left">Three-spined stickleback</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Gasterosteidae</td>
<td align="left"><em>Pungitius pungitius</em></td>
<td align="left">Ninespine stickleback</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gasterosteidae</td>
<td align="left"><em>Spinachia spinachia</em></td>
<td align="left">Sea stickleback</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Gobiesocidae</td>
<td align="left"><em>Apletodon dentatus</em></td>
<td align="left">Small-headed clingfish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gobiesocidae</td>
<td align="left"><em>Diplecogaster bimaculata</em></td>
<td align="left">Two-spotted clingfish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Gobiesocidae</td>
<td align="left"><em>Lepadogaster candolii</em></td>
<td align="left">Connemarra clingfish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gobiesocidae</td>
<td align="left"><em>Lepadogaster purpurea</em></td>
<td align="left">Cornish sucker</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Lophiidae</td>
<td align="left"><em>Lophius piscatorius</em></td>
<td align="left">Angler</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Mugilidae</td>
<td align="left"><em>Chelon auratus</em></td>
<td align="left">Golden grey mullet</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Mugilidae</td>
<td align="left"><em>Chelon labrosus</em></td>
<td align="left">Thicklip grey mullet</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Mugilidae</td>
<td align="left"><em>Chelon ramada</em></td>
<td align="left">Thinlip grey mullet</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">15</td>
<td align="right">15</td>
<td align="right">0</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">Osmeridae</td>
<td align="left"><em>Osmerus eperlanus</em></td>
<td align="left">European smelt</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Ammodytidae</td>
<td align="left"><em>Ammodytes marinus</em></td>
<td align="left">Lesser sand-eel</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Ammodytidae</td>
<td align="left"><em>Ammodytes tobianus</em></td>
<td align="left">Small sandeel</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Ammodytidae</td>
<td align="left"><em>Gymnammodytes semisquamatus</em></td>
<td align="left">Smooth sandeel</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Ammodytidae</td>
<td align="left"><em>Hyperoplus immaculatus</em></td>
<td align="left">Greater sand-eel</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Ammodytidae</td>
<td align="left"><em>Hyperoplus lanceolatus</em></td>
<td align="left">Great sandeel</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Anarhichadidae</td>
<td align="left"><em>Anarhichas lupus</em></td>
<td align="left">Atlantic wolffish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Blenniidae</td>
<td align="left"><em>Blennius ocellaris</em></td>
<td align="left">Butterfly blenny</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Blenniidae</td>
<td align="left"><em>Coryphoblennius galerita</em></td>
<td align="left">Montagu's blenny</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Blenniidae</td>
<td align="left"><em>Lipophrys pholis</em></td>
<td align="left">Shanny</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Blenniidae</td>
<td align="left"><em>Parablennius gattorugine</em></td>
<td align="left">Tompot blenny</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Callionymidae</td>
<td align="left"><em>Callionymus lyra</em></td>
<td align="left">Dragonet</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Callionymidae</td>
<td align="left"><em>Callionymus maculatus</em></td>
<td align="left"></td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Callionymidae</td>
<td align="left"><em>Callionymus reticulatus</em></td>
<td align="left">Reticulated dragonet</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Caproidae</td>
<td align="left"><em>Capros aper</em></td>
<td align="left">Boarfish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Carangidae</td>
<td align="left"><em>Trachurus trachurus</em></td>
<td align="left">Atlantic horse mackerel</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Cepolidae</td>
<td align="left"><em>Cepola macrophthalma</em></td>
<td align="left">Red bandfish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gobiidae</td>
<td align="left"><em>Aphia minuta</em></td>
<td align="left">Transparent goby</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Gobiidae</td>
<td align="left"><em>Crystallogobius linearis</em></td>
<td align="left">Crystal goby</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gobiidae</td>
<td align="left"><em>Gobius cobitis</em></td>
<td align="left">Giant goby</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Gobiidae</td>
<td align="left"><em>Gobiusculus flavescens</em></td>
<td align="left">Two-spotted goby</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gobiidae</td>
<td align="left"><em>Gobius niger</em></td>
<td align="left">Black goby</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Gobiidae</td>
<td align="left"><em>Gobius paganellus</em></td>
<td align="left">Rock goby</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gobiidae</td>
<td align="left"><em>Lesueurigobius friesii</em></td>
<td align="left">Fries's goby</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Gobiidae</td>
<td align="left"><em>Pomatoschistus lozanoi</em></td>
<td align="left">Lozano's goby</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gobiidae</td>
<td align="left"><em>Pomatoschistus microps</em></td>
<td align="left">Common goby</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Gobiidae</td>
<td align="left"><em>Pomatoschistus minutus</em></td>
<td align="left">Sand goby</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gobiidae</td>
<td align="left"><em>Pomatoschistus norvegicus</em></td>
<td align="left">Norway goby</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Gobiidae</td>
<td align="left"><em>Pomatoschistus pictus</em></td>
<td align="left">Painted goby</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Gobiidae</td>
<td align="left"><em>Thorogobius ephippiatus</em></td>
<td align="left">Leopard-spotted goby</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Labridae</td>
<td align="left"><em>Centrolabrus exoletus</em></td>
<td align="left">Rock cook</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Labridae</td>
<td align="left"><em>Ctenolabrus rupestris</em></td>
<td align="left">Goldsinny-wrasse</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Labridae</td>
<td align="left"><em>Labrus bergylta</em></td>
<td align="left">Ballan wrasse</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Labridae</td>
<td align="left"><em>Labrus mixtus</em></td>
<td align="left">Cuckoo wrasse</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Labridae</td>
<td align="left"><em>Symphodus bailloni</em></td>
<td align="left">Baillon's wrasse</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Labridae</td>
<td align="left"><em>Symphodus melops</em></td>
<td align="left">Corkwing wrasse</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Moronidae</td>
<td align="left"><em>Dicentrarchus labrax</em></td>
<td align="left">European seabass</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Mullidae</td>
<td align="left"><em>Mullus surmuletus</em></td>
<td align="left">Surmullet</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Percidae</td>
<td align="left"><em>Gymnocephalus cernua</em></td>
<td align="left">Ruffe</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Percidae</td>
<td align="left"><em>Perca fluviatilis</em></td>
<td align="left">European perch</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Percidae</td>
<td align="left"><em>Sander lucioperca</em></td>
<td align="left">Pike-perch</td>
<td align="right">2</td>
<td align="right">2</td>
<td align="right">2</td>
<td align="right">2</td>
<td align="right">2</td>
<td align="right">68</td>
<td align="right">68</td>
<td align="right">2</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">Pholidae</td>
<td align="left"><em>Pholis gunnellus</em></td>
<td align="left">Rock gunnel</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Scombridae</td>
<td align="left"><em>Scomber scombrus</em></td>
<td align="left">Atlantic mackerel</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Sparidae</td>
<td align="left"><em>Pagellus bogaraveo</em></td>
<td align="left">Blackspot seabream</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Sparidae</td>
<td align="left"><em>Pagrus pagrus</em></td>
<td align="left">Red porgy</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Sparidae</td>
<td align="left"><em>Sparus aurata</em></td>
<td align="left">Gilthead seabream</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Sparidae</td>
<td align="left"><em>Spondyliosoma cantharus</em></td>
<td align="left">Black seabream</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Stichaeidae</td>
<td align="left"><em>Chirolophis ascanii</em></td>
<td align="left">Yarrell's blenny</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Stichaeidae</td>
<td align="left"><em>Lumpenus lampretaeformis</em></td>
<td align="left">Snakeblenny</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Trachinidae</td>
<td align="left"><em>Echiichthys vipera</em></td>
<td align="left">Lesser weever</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Trachinidae</td>
<td align="left"><em>Trachinus draco</em></td>
<td align="left">Greater weever</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Zoarcidae</td>
<td align="left"><em>Zoarces viviparus</em></td>
<td align="left">Eelpout</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Bothidae</td>
<td align="left"><em>Arnoglossus laterna</em></td>
<td align="left">Mediterranean scaldfish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Pleuronectidae</td>
<td align="left"><em>Glyptocephalus cynoglossus</em></td>
<td align="left">Witch flounder</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Pleuronectidae</td>
<td align="left"><em>Hippoglossoides platessoides</em></td>
<td align="left">American plaice</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Pleuronectidae</td>
<td align="left"><em>Hippoglossus hippoglossus</em></td>
<td align="left">Atlantic halibut</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Pleuronectidae</td>
<td align="left"><em>Limanda limanda</em></td>
<td align="left">Common dab</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Pleuronectidae</td>
<td align="left"><em>Microstomus kitt</em></td>
<td align="left">Lemon sole</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Pleuronectidae</td>
<td align="left"><em>Platichthys flesus</em></td>
<td align="left">European flounder</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Pleuronectidae</td>
<td align="left"><em>Pleuronectes platessa</em></td>
<td align="left">European plaice</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Scophthalmidae</td>
<td align="left"><em>Lepidorhombus whiffiagonis</em></td>
<td align="left">Megrim</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Scophthalmidae</td>
<td align="left"><em>Phrynorhombus norvegicus</em></td>
<td align="left">Norwegian topknot</td>
<td align="right">0</td>
<td align="right">1</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">4</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">Scophthalmidae</td>
<td align="left"><em>Scophthalmus maximus</em></td>
<td align="left">Turbot</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Scophthalmidae</td>
<td align="left"><em>Scophthalmus rhombus</em></td>
<td align="left">Brill</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Scophthalmidae</td>
<td align="left"><em>Zeugopterus punctatus</em></td>
<td align="left">Topknot</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Scophthalmidae</td>
<td align="left"><em>Zeugopterus regius</em></td>
<td align="left">Eckstr<f6>m's topknot</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Soleidae</td>
<td align="left"><em>Buglossidium luteum</em></td>
<td align="left">Solenette</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">20</td>
<td align="right">20</td>
<td align="right">8</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">Soleidae</td>
<td align="left"><em>Microchirus variegatus</em></td>
<td align="left">Thickback sole</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Soleidae</td>
<td align="left"><em>Pegusa lascaris</em></td>
<td align="left">Sand sole</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Soleidae</td>
<td align="left"><em>Solea solea</em></td>
<td align="left">Common sole</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Salmonidae</td>
<td align="left"><em>Oncorhynchus mykiss</em></td>
<td align="left">Rainbow trout</td>
<td align="right">19</td>
<td align="right">25</td>
<td align="right">19</td>
<td align="right">20</td>
<td align="right">40</td>
<td align="right">390</td>
<td align="right">390</td>
<td align="right">75</td>
<td align="right">0</td>
</tr>
<tr class="even">
<td align="left">Salmonidae</td>
<td align="left"><em>Salmo salar</em></td>
<td align="left">Atlantic salmon</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Salmonidae</td>
<td align="left"><em>Salmo trutta</em></td>
<td align="left">Sea trout</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Salmonidae</td>
<td align="left"><em>Thymallus thymallus</em></td>
<td align="left">Grayling</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Agonidae</td>
<td align="left"><em>Agonus cataphractus</em></td>
<td align="left">Hooknose</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Cottidae</td>
<td align="left"><em>Cottus gobio</em></td>
<td align="left">Bullhead</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Cottidae</td>
<td align="left"><em>Micrenophrys lilljeborgii</em></td>
<td align="left">Norway bullhead</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Cottidae</td>
<td align="left"><em>Myoxocephalus scorpius</em></td>
<td align="left">Shorthorn sculpin</td>
<td align="right">3</td>
<td align="right">3</td>
<td align="right">3</td>
<td align="right">3</td>
<td align="right">3</td>
<td align="right">3</td>
<td align="right">3</td>
<td align="right">9</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">Cottidae</td>
<td align="left"><em>Taurulus bubalis</em></td>
<td align="left">Longspined bullhead</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Cyclopteridae</td>
<td align="left"><em>Cyclopterus lumpus</em></td>
<td align="left">Lumpfish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Liparidae</td>
<td align="left"><em>Liparis liparis</em></td>
<td align="left">Striped seasnail</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Liparidae</td>
<td align="left"><em>Liparis montagui</em></td>
<td align="left">Montagus seasnail</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Triglidae</td>
<td align="left"><em>Chelidonichthys cuculus</em></td>
<td align="left">Red gurnard</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Triglidae</td>
<td align="left"><em>Chelidonichthys lastoviza</em></td>
<td align="left">Streaked gurnard</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Triglidae</td>
<td align="left"><em>Chelidonichthys lucerna</em></td>
<td align="left">Tub gurnard</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Triglidae</td>
<td align="left"><em>Eutrigla gurnardus</em></td>
<td align="left">Grey gurnard</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Siluridae</td>
<td align="left"><em>Silurus glanis</em></td>
<td align="left">Wels catfish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Syngnathidae</td>
<td align="left"><em>Entelurus aequoreus</em></td>
<td align="left">Snake pipefish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Syngnathidae</td>
<td align="left"><em>Hippocampus guttulatus</em></td>
<td align="left">Long-snouted seahorse</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Syngnathidae</td>
<td align="left"><em>Hippocampus hippocampus</em></td>
<td align="left">Short snouted seahorse</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Syngnathidae</td>
<td align="left"><em>Nerophis lumbriciformis</em></td>
<td align="left">Worm pipefish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Syngnathidae</td>
<td align="left"><em>Nerophis ophidion</em></td>
<td align="left">Straightnose pipefish</td>
<td align="right">0</td>
<td align="right">2</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">3</td>
<td align="right">2</td>
<td align="right">2</td>
<td align="right">1</td>
<td align="right">0</td>
</tr>
<tr class="odd">
<td align="left">Syngnathidae</td>
<td align="left"><em>Syngnathus acus</em></td>
<td align="left">Greater pipefish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Syngnathidae</td>
<td align="left"><em>Syngnathus rostellatus</em></td>
<td align="left">Nilsson's pipefish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Syngnathidae</td>
<td align="left"><em>Syngnathus typhle</em></td>
<td align="left">Broadnosed pipefish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Balistidae</td>
<td align="left"><em>Balistes capriscus</em></td>
<td align="left">Grey triggerfish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Molidae</td>
<td align="left"><em>Mola mola</em></td>
<td align="left">Ocean sunfish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Zeidae</td>
<td align="left"><em>Zeus faber</em></td>
<td align="left">John dory</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Petromyzontidae</td>
<td align="left"><em>Lampetra fluviatilis</em></td>
<td align="left">River lamprey</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Petromyzontidae</td>
<td align="left"><em>Lampetra planeri</em></td>
<td align="left">European brook lamprey</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Petromyzontidae</td>
<td align="left"><em>Petromyzon marinus</em></td>
<td align="left">Sea lamprey</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Carcharhinidae</td>
<td align="left"><em>Prionace glauca</em></td>
<td align="left">Blue shark</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Scyliorhinidae</td>
<td align="left"><em>Scyliorhinus canicula</em></td>
<td align="left">Lesser spotted dogfish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Scyliorhinidae</td>
<td align="left"><em>Scyliorhinus stellaris</em></td>
<td align="left">Nursehound</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Triakidae</td>
<td align="left"><em>Galeorhinus galeus</em></td>
<td align="left">Tope shark</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Triakidae</td>
<td align="left"><em>Mustelus asterias</em></td>
<td align="left">Starry smooth-hound</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Alopiidae</td>
<td align="left"><em>Alopias vulpinus</em></td>
<td align="left">Thresher</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Cetorhinidae</td>
<td align="left"><em>Cetorhinus maximus</em></td>
<td align="left">Basking shark</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Lamnidae</td>
<td align="left"><em>Lamna nasus</em></td>
<td align="left">Porbeagle</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Dasyatidae</td>
<td align="left"><em>Dasyatis pastinaca</em></td>
<td align="left">Common stingray</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Rajidae</td>
<td align="left"><em>Amblyraja radiata</em></td>
<td align="left">Starry ray</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Rajidae</td>
<td align="left"><em>Leucoraja naevus</em></td>
<td align="left">Cuckoo ray</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Rajidae</td>
<td align="left"><em>Raja brachyura</em></td>
<td align="left">Blonde ray</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Rajidae</td>
<td align="left"><em>Raja clavata</em></td>
<td align="left">Thornback ray</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Rajidae</td>
<td align="left"><em>Raja microocellata</em></td>
<td align="left">Small-eyed ray</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Rajidae</td>
<td align="left"><em>Raja montagui</em></td>
<td align="left">Spotted ray</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="odd">
<td align="left">Rajidae</td>
<td align="left"><em>Raja undulata</em></td>
<td align="left">Undulate ray</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
<tr class="even">
<td align="left">Squalidae</td>
<td align="left"><em>Squalus acanthias</em></td>
<td align="left">Picked dogfish</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right">0</td>
<td align="right"></td>
</tr>
</tbody>
</table>
