Reference library coverage report
================
Rupert A. Collins
08 October 2022

##### Methods and description

This document describes the contents of the UK fish reference library,
generated from public databases. The document is a dynamic knitr
document and can be updated quickly using the Makefile in `scripts/`. A
list of species from the UK was generated from three sources: GBIF,
FishBase, and the Water Framework Directive list of transitional
species. This list was filtered to identify synonyms and duplicates, and
annotated with FishBase taxonomic classification and FishBase common
names. Next a sub-list of “common” species was generated. These were
species that we believe are likely to be encountered in eDNA surveys of
inshore and transitional waters of the UK, and comprise most of the
species in Henderson (2015). Most of the remaining are either introduced
species, rarely encountered migrants, oceanic pelagics, or deep sea
organisms.

The search was performed on the NCBI nucleotide and BOLD sequences
databases. Because of inconsistencies in how researchers annotate their
GenBank submissions and the differing internal coverage of primer pairs
for particular gene fragments, we performed a search requesting
mitochondrial DNA using multiple search relevant search terms (COI, 12S,
16S, rRNA, ribosomal, cytb, CO1, cox1, cytochrome, subunit, COB, CYB,
mitochondrial, mitochondrion). Then we pulled out fragments of interest
using a hidden Markov model. This enabled us to have greater confidence
that useful sequences had not been missed. For the resulting sequences
we then tabulate all their metadata from GenBank in order to allow us
the capability to later tailor a custom reference library according to
any criteria required (e.g. must have reference specimen or locality
data etc).

##### Results

The total number of accepted UK species is estimated to be around 531,
with 176 common species, and 4280 total names including synonyms. The
NCBI GenBank and BOLD databases were searched on 06 Oct 2022 (GenBank
version 251), and the search retrieved 58602 accessions from 497 unique
species. Below is presented a summary table of reference library
coverage (Table 1), numbers of individuals per common species (Table 2),
and the sequences added to the reference library in the most recent
update (Table 3).

**Table 1. Summary of coverage. Locus = mitochondrial gene; Fragment =
metabarcode primer set; Total = total number of sequences; Cov. (all) =
proportion of all species with at least one sequence; Cov. (common) =
proportion of common species with at least one sequence; Cov. (rare) =
proportion of rare species with at least one sequence; Singletons =
proportion of species represented by only one sequence, only including
those with \>0 sequences; Haps (mean) = mean number unique haplotypes
per species; Haps (median) = median number unique haplotypes per
species.**

| Locus | Fragment  | Total | Cov. (all) | Cov. (common) | Cov. (rare) | Singletons | Haps (mean) | Haps (median) |
| :---- | :-------- | ----: | ---------: | ------------: | ----------: | ---------: | ----------: | ------------: |
| 12S   | Miya      |  2975 |       0.77 |          0.97 |        0.68 |       0.15 |         1.9 |             1 |
| 12S   | Riaz      |  3396 |       0.75 |          0.94 |        0.65 |       0.19 |         1.8 |             1 |
| 12S   | Taberlet  |  2975 |       0.77 |          0.97 |        0.68 |       0.15 |         1.9 |             1 |
| 12S   | Valentini |  2185 |       0.62 |          0.77 |        0.55 |       0.25 |         1.4 |             1 |
| 16S   | Berry     |  5252 |       0.79 |          0.97 |        0.71 |       0.13 |         3.6 |             2 |
| 16S   | Kitano    |  5197 |       0.80 |          0.97 |        0.72 |       0.14 |         2.6 |             2 |
| COI   | Lerayxt   | 34221 |       0.92 |          0.98 |        0.89 |       0.03 |        12.3 |             7 |
| COI   | Ward      | 34404 |       0.92 |          0.98 |        0.89 |       0.03 |        21.1 |            11 |
| CYTB  | Minamoto  | 19624 |       0.69 |          0.89 |        0.59 |       0.14 |         8.8 |             2 |

**Table 2. Numbers of sequences represented per species for each primer
set metabarcode fragment. Only common species are shown.**

| Family          | Scientific Name                | Common Name              | 12S (Miya) | 12S (Riaz) | 12S (Taberlet) | 12S (Valentini) | 16S (Berry) | 16S (Kitano) | COI (Lerayxt) | COI (Ward) | CYTB (Minamoto) |
| :-------------- | :----------------------------- | :----------------------- | ---------: | ---------: | -------------: | --------------: | ----------: | -----------: | ------------: | ---------: | --------------: |
| Anguillidae     | *Anguilla anguilla*            | European eel             |         64 |         67 |             64 |              60 |         231 |          248 |           244 |        244 |             141 |
| Congridae       | *Conger conger*                | European conger          |          3 |          0 |              3 |               0 |           2 |            2 |            34 |         34 |               0 |
| Atherinidae     | *Atherina boyeri*              | Big-scale sand smelt     |         11 |        170 |             11 |               2 |          68 |           68 |            32 |         32 |             103 |
| Belonidae       | *Belone belone*                | Garfish                  |          5 |          4 |              5 |               1 |           6 |            6 |            43 |         43 |               9 |
| Clupeidae       | *Alosa alosa*                  | Allis shad               |          2 |          2 |              2 |               2 |           4 |            4 |            32 |         32 |             197 |
| Clupeidae       | *Alosa fallax*                 | Twaite shad              |          3 |          6 |              3 |               6 |          10 |           10 |            18 |         18 |             520 |
| Clupeidae       | *Clupea harengus*              | Atlantic herring         |        107 |        115 |            107 |             109 |         120 |          119 |           191 |        191 |             196 |
| Clupeidae       | *Sardina pilchardus*           | European pilchard        |         11 |          7 |             11 |               4 |          34 |           32 |           236 |        241 |              99 |
| Clupeidae       | *Sprattus sprattus*            | European sprat           |          8 |          6 |              8 |               3 |          15 |           14 |            75 |         75 |              20 |
| Engraulidae     | *Engraulis encrasicolus*       | European anchovy         |          7 |         21 |              7 |               9 |          75 |           68 |           270 |        270 |            1016 |
| Cobitidae       | *Cobitis taenia*               | Spined loach             |          4 |          7 |              4 |               2 |           5 |            5 |            22 |         22 |             189 |
| Cyprinidae      | *Abramis brama*                | Freshwater bream         |          9 |          8 |              9 |               8 |           9 |            9 |           101 |        101 |              28 |
| Cyprinidae      | *Alburnus alburnus*            | Bleak                    |          3 |          4 |              3 |               3 |          10 |           10 |           248 |        249 |              37 |
| Cyprinidae      | *Barbus barbus*                | Barbel                   |          5 |          5 |              5 |               4 |           7 |            7 |           154 |        154 |              81 |
| Cyprinidae      | *Blicca bjoerkna*              | White bream              |          5 |          5 |              5 |               5 |          10 |           10 |            64 |         64 |               8 |
| Cyprinidae      | *Carassius auratus*            | Goldfish                 |         62 |         54 |             62 |              51 |          85 |           84 |           330 |        330 |             801 |
| Cyprinidae      | *Carassius carassius*          | Crucian carp             |          2 |          3 |              2 |               2 |           3 |            4 |            48 |         48 |             128 |
| Cyprinidae      | *Cyprinus carpio*              | Common carp              |         78 |         75 |             78 |              70 |         130 |          131 |           760 |        761 |             732 |
| Cyprinidae      | *Gobio gobio*                  | Gudgeon                  |          5 |          4 |              5 |               4 |          12 |           12 |           130 |        130 |              45 |
| Cyprinidae      | *Leuciscus idus*               | Ide                      |          3 |          3 |              3 |               2 |           7 |            8 |            62 |         62 |              10 |
| Cyprinidae      | *Leuciscus leuciscus*          | Common dace              |          3 |          1 |              3 |               1 |          47 |           47 |           163 |        163 |             154 |
| Cyprinidae      | *Phoxinus phoxinus*            | Eurasian minnow          |         19 |         17 |             19 |              17 |          21 |           20 |          1325 |       1325 |             889 |
| Cyprinidae      | *Pseudorasbora parva*          | Stone moroko             |         15 |         10 |             15 |               9 |          47 |           44 |           278 |        278 |            1129 |
| Cyprinidae      | *Rutilus rutilus*              | Roach                    |          3 |          7 |              3 |               3 |          15 |           15 |           139 |        139 |             274 |
| Cyprinidae      | *Scardinius erythrophthalmus*  | Rudd                     |          5 |          5 |              5 |               4 |           8 |            8 |           108 |        108 |              28 |
| Cyprinidae      | *Squalius cephalus*            | Chub                     |          4 |          5 |              4 |               4 |           8 |            8 |           307 |        307 |             165 |
| Cyprinidae      | *Tinca tinca*                  | Tench                    |          9 |          9 |              9 |               8 |          13 |           13 |           179 |        179 |              36 |
| Nemacheilidae   | *Barbatula barbatula*          | Stone loach              |          9 |          8 |              9 |               8 |          11 |           11 |           159 |        159 |             344 |
| Esocidae        | *Esox lucius*                  | Northern pike            |         10 |         19 |             10 |              10 |          32 |           32 |           201 |        202 |             326 |
| Gadidae         | *Gadiculus argenteus*          | Silvery pout             |          4 |          4 |              4 |               2 |           7 |            7 |            38 |         38 |              11 |
| Gadidae         | *Gadus morhua*                 | Atlantic cod             |        172 |        178 |            172 |             170 |         184 |          184 |           531 |        532 |            1102 |
| Gadidae         | *Melanogrammus aeglefinus*     | Haddock                  |          8 |          7 |              8 |               7 |          12 |            9 |           246 |        247 |              44 |
| Gadidae         | *Merlangius merlangus*         | Whiting                  |         10 |         12 |             10 |               5 |          21 |           20 |           113 |        114 |              41 |
| Gadidae         | *Micromesistius poutassou*     | Blue whiting             |          7 |          6 |              7 |               4 |           8 |            7 |           111 |        111 |              22 |
| Gadidae         | *Pollachius pollachius*        | Pollack                  |          7 |          5 |              7 |               4 |           2 |            2 |            17 |         17 |              12 |
| Gadidae         | *Pollachius virens*            | Saithe                   |          9 |          9 |              9 |               5 |           7 |            6 |            85 |         85 |              27 |
| Gadidae         | *Raniceps raninus*             | Tadpole fish             |          5 |          2 |              5 |               2 |           5 |            5 |             3 |          3 |               1 |
| Gadidae         | *Trisopterus esmarkii*         | Norway pout              |          3 |          4 |              3 |               2 |           4 |            4 |            36 |         36 |              10 |
| Gadidae         | *Trisopterus luscus*           | Pouting                  |          5 |          6 |              5 |               2 |           5 |            5 |            25 |         25 |              23 |
| Gadidae         | *Trisopterus minutus*          | Poor cod                 |          8 |          8 |              8 |               2 |           9 |            9 |            31 |         31 |              42 |
| Lotidae         | *Ciliata mustela*              | Fivebeard rockling       |          5 |          7 |              5 |               0 |           6 |            6 |            22 |         22 |              92 |
| Lotidae         | *Ciliata septentrionalis*      | Northern rockling        |          3 |          0 |              3 |               0 |           0 |            0 |             0 |          0 |               2 |
| Lotidae         | *Enchelyopus cimbrius*         | Fourbeard rockling       |          4 |          3 |              4 |               0 |           6 |            6 |            39 |         39 |              12 |
| Lotidae         | *Gaidropsarus mediterraneus*   | Shore rockling           |          0 |          7 |              0 |               0 |           6 |            6 |            23 |         23 |              12 |
| Lotidae         | *Gaidropsarus vulgaris*        | Three-bearded rockling   |          0 |          3 |              0 |               0 |           4 |            4 |            25 |         25 |               9 |
| Lotidae         | *Molva molva*                  | Ling                     |          3 |          2 |              3 |               2 |           3 |            3 |            22 |         22 |              21 |
| Merlucciidae    | *Merluccius merluccius*        | European hake            |          5 |         11 |              5 |               3 |          33 |           32 |           343 |        343 |             102 |
| Gasterosteidae  | *Gasterosteus aculeatus*       | Three-spined stickleback |         20 |         20 |             20 |              14 |          25 |           25 |           353 |        353 |             542 |
| Gasterosteidae  | *Pungitius pungitius*          | Ninespine stickleback    |         11 |         29 |             11 |              11 |          48 |           48 |           164 |        164 |             321 |
| Gasterosteidae  | *Spinachia spinachia*          | Sea stickleback          |          5 |          6 |              5 |               4 |           6 |            6 |             7 |          7 |               4 |
| Gobiesocidae    | *Apletodon dentatus*           | Small-headed clingfish   |          1 |          4 |              1 |               0 |           3 |            3 |             1 |          1 |               0 |
| Gobiesocidae    | *Diplecogaster bimaculata*     | Two-spotted clingfish    |          2 |          2 |              2 |               0 |           1 |            1 |             5 |          5 |               0 |
| Gobiesocidae    | *Lepadogaster candolii*        | Connemarra clingfish     |          0 |          6 |              0 |               0 |           4 |            4 |             2 |          2 |               0 |
| Gobiesocidae    | *Lepadogaster purpurea*        | Cornish sucker           |          2 |         12 |              2 |               0 |           1 |            1 |             6 |          6 |               0 |
| Lophiidae       | *Lophius piscatorius*          | Angler                   |          6 |          4 |              6 |               3 |          11 |           12 |            90 |         90 |              24 |
| Mugilidae       | *Chelon auratus*               | Golden grey mullet       |          4 |          8 |              4 |               2 |          19 |           19 |            68 |         68 |              18 |
| Mugilidae       | *Chelon labrosus*              | Thicklip grey mullet     |          7 |         10 |              7 |               4 |          15 |           15 |            31 |         31 |              13 |
| Mugilidae       | *Chelon ramada*                | Thinlip grey mullet      |          7 |         10 |              7 |               1 |          12 |           12 |            48 |         48 |              10 |
| Osmeridae       | *Osmerus eperlanus*            | European smelt           |          4 |          8 |              4 |               4 |          10 |           10 |            36 |         36 |              21 |
| Ammodytidae     | *Ammodytes marinus*            | Lesser sand-eel          |          5 |          8 |              5 |               2 |           1 |            1 |            52 |         52 |               1 |
| Ammodytidae     | *Ammodytes tobianus*           | Small sandeel            |          7 |          4 |              7 |               2 |           2 |            2 |            13 |         13 |               1 |
| Ammodytidae     | *Gymnammodytes semisquamatus*  | Smooth sandeel           |          3 |          2 |              3 |               2 |           2 |            2 |             2 |          2 |               2 |
| Ammodytidae     | *Hyperoplus immaculatus*       | Greater sand-eel         |          2 |          1 |              2 |               1 |           0 |            0 |            10 |         10 |               0 |
| Ammodytidae     | *Hyperoplus lanceolatus*       | Great sandeel            |          5 |          2 |              5 |               1 |           2 |            2 |            39 |         39 |               2 |
| Anarhichadidae  | *Anarhichas lupus*             | Atlantic wolffish        |         90 |         89 |             90 |              89 |          93 |           93 |           196 |        196 |              95 |
| Blenniidae      | *Blennius ocellaris*           | Butterfly blenny         |          4 |          2 |              4 |               0 |           4 |            4 |            24 |         24 |               0 |
| Blenniidae      | *Coryphoblennius galerita*     | Montagu’s blenny         |          3 |         63 |              3 |               1 |          69 |           69 |             8 |          8 |               1 |
| Blenniidae      | *Lipophrys pholis*             | Shanny                   |          6 |         15 |              6 |               1 |          10 |           10 |             8 |          8 |               0 |
| Blenniidae      | *Parablennius gattorugine*     | Tompot blenny            |          1 |          5 |              1 |               0 |           8 |            8 |             4 |          4 |               0 |
| Callionymidae   | *Callionymus lyra*             | Dragonet                 |          3 |          2 |              3 |               0 |           5 |            5 |            31 |         31 |               0 |
| Callionymidae   | *Callionymus maculatus*        |                          |          5 |          0 |              5 |               0 |           1 |            1 |            12 |         12 |               0 |
| Callionymidae   | *Callionymus reticulatus*      | Reticulated dragonet     |          1 |          0 |              1 |               0 |           0 |            0 |            10 |         10 |               0 |
| Caproidae       | *Capros aper*                  | Boarfish                 |          3 |          4 |              3 |               2 |           6 |            6 |            33 |         33 |               2 |
| Carangidae      | *Trachurus trachurus*          | Atlantic horse mackerel  |          8 |          6 |              8 |               5 |          23 |           22 |           173 |        174 |              35 |
| Cepolidae       | *Cepola macrophthalma*         | Red bandfish             |          6 |          0 |              6 |               0 |           1 |            1 |            27 |         27 |               0 |
| Gobiidae        | *Aphia minuta*                 | Transparent goby         |          4 |          5 |              4 |               3 |          15 |           15 |            21 |         21 |              12 |
| Gobiidae        | *Crystallogobius linearis*     | Crystal goby             |          2 |          3 |              2 |               3 |           4 |            4 |            12 |         12 |               1 |
| Gobiidae        | *Gobius cobitis*               | Giant goby               |          2 |          2 |              2 |               2 |           2 |            2 |            11 |         11 |               1 |
| Gobiidae        | *Gobius niger*                 | Black goby               |          6 |          5 |              6 |               3 |          11 |           11 |            70 |         70 |               5 |
| Gobiidae        | *Gobius paganellus*            | Rock goby                |          5 |          2 |              5 |               1 |           4 |            4 |            17 |         17 |               1 |
| Gobiidae        | *Gobiusculus flavescens*       | Two-spotted goby         |          3 |          4 |              3 |               3 |           6 |            6 |            14 |         14 |               5 |
| Gobiidae        | *Lesueurigobius friesii*       | Fries’s goby             |          3 |          3 |              3 |               3 |           6 |            6 |             6 |          6 |               2 |
| Gobiidae        | *Pomatoschistus lozanoi*       | Lozano’s goby            |          0 |          2 |              0 |               0 |           1 |            1 |             8 |          8 |               3 |
| Gobiidae        | *Pomatoschistus microps*       | Common goby              |          9 |          6 |              9 |               2 |           4 |            4 |            17 |         17 |              39 |
| Gobiidae        | *Pomatoschistus minutus*       | Sand goby                |          9 |          8 |              9 |               4 |          10 |           10 |            18 |         18 |             137 |
| Gobiidae        | *Pomatoschistus norvegicus*    | Norway goby              |          0 |          1 |              0 |               0 |           2 |            2 |            11 |         11 |               0 |
| Gobiidae        | *Pomatoschistus pictus*        | Painted goby             |          6 |          2 |              6 |               0 |           2 |            2 |             6 |          6 |               0 |
| Gobiidae        | *Thorogobius ephippiatus*      | Leopard-spotted goby     |          0 |          1 |              0 |               1 |           1 |            1 |             4 |          4 |               1 |
| Labridae        | *Centrolabrus exoletus*        | Rock cook                |          4 |          5 |              4 |               3 |           7 |            7 |             6 |          6 |               3 |
| Labridae        | *Ctenolabrus rupestris*        | Goldsinny-wrasse         |          8 |          6 |              8 |               4 |           6 |            6 |            12 |         12 |               5 |
| Labridae        | *Labrus bergylta*              | Ballan wrasse            |          6 |          5 |              6 |               2 |           6 |            6 |           163 |        165 |               5 |
| Labridae        | *Labrus mixtus*                | Cuckoo wrasse            |          2 |          1 |              2 |               0 |           3 |            3 |            28 |         28 |               2 |
| Labridae        | *Symphodus bailloni*           | Baillon’s wrasse         |          6 |          3 |              6 |               1 |           3 |            3 |             3 |          3 |               0 |
| Labridae        | *Symphodus melops*             | Corkwing wrasse          |          6 |          4 |              6 |               1 |           5 |            5 |             5 |          5 |               0 |
| Moronidae       | *Dicentrarchus labrax*         | European seabass         |          6 |          9 |              6 |               3 |          14 |           13 |            65 |         65 |              27 |
| Mullidae        | *Mullus surmuletus*            | Surmullet                |          6 |          9 |              6 |               2 |          23 |           22 |            99 |         99 |              19 |
| Percidae        | *Gymnocephalus cernua*         | Ruffe                    |          5 |          8 |              5 |               5 |          12 |           12 |            96 |         96 |               9 |
| Percidae        | *Perca fluviatilis*            | European perch           |         21 |         15 |             21 |              10 |          41 |           42 |           182 |        182 |              54 |
| Percidae        | *Sander lucioperca*            | Pike-perch               |          6 |          4 |              6 |               4 |           7 |            8 |           104 |        104 |              30 |
| Pholidae        | *Pholis gunnellus*             | Rock gunnel              |         10 |         10 |             10 |               7 |           7 |            7 |            27 |         27 |               3 |
| Scombridae      | *Scomber scombrus*             | Atlantic mackerel        |          6 |         28 |              6 |               3 |          16 |           15 |           445 |        445 |              78 |
| Sparidae        | *Pagellus bogaraveo*           | Blackspot seabream       |          3 |          3 |              3 |               2 |           3 |            3 |            20 |         28 |              16 |
| Sparidae        | *Pagrus pagrus*                | Red porgy                |          3 |          1 |              3 |               0 |           5 |            5 |            68 |         72 |              13 |
| Sparidae        | *Sparus aurata*                | Gilthead seabream        |          8 |          7 |              8 |               3 |          15 |           14 |           189 |        189 |              70 |
| Sparidae        | *Spondyliosoma cantharus*      | Black seabream           |          3 |          1 |              3 |               0 |           4 |            4 |            50 |         50 |              77 |
| Stichaeidae     | *Chirolophis ascanii*          | Yarrell’s blenny         |          2 |          2 |              2 |               2 |           2 |            2 |             2 |          2 |               2 |
| Stichaeidae     | *Lumpenus lampretaeformis*     | Snakeblenny              |          3 |          2 |              3 |               2 |           2 |            2 |            33 |         33 |              65 |
| Trachinidae     | *Echiichthys vipera*           | Lesser weever            |          5 |          4 |              5 |               2 |           3 |            3 |            20 |         20 |               4 |
| Trachinidae     | *Trachinus draco*              | Greater weever           |          4 |          3 |              4 |               1 |           7 |            7 |            34 |         34 |               7 |
| Zoarcidae       | *Zoarces viviparus*            | Eelpout                  |          2 |          2 |              2 |               0 |           5 |            5 |             7 |          7 |              82 |
| Bothidae        | *Arnoglossus laterna*          | Mediterranean scaldfish  |          6 |          4 |              6 |               0 |          10 |           10 |            60 |         60 |               1 |
| Pleuronectidae  | *Glyptocephalus cynoglossus*   | Witch flounder           |          4 |          3 |              4 |               3 |           4 |            4 |            60 |         60 |              17 |
| Pleuronectidae  | *Hippoglossoides platessoides* | American plaice          |          5 |          4 |              5 |               2 |           7 |            6 |            62 |         62 |              16 |
| Pleuronectidae  | *Hippoglossus hippoglossus*    | Atlantic halibut         |          6 |          6 |              6 |               5 |           7 |            8 |            31 |         31 |              15 |
| Pleuronectidae  | *Limanda limanda*              | Common dab               |          6 |          7 |              6 |               2 |          16 |           16 |            45 |         45 |              78 |
| Pleuronectidae  | *Microstomus kitt*             | Lemon sole               |          5 |          4 |              5 |               2 |           5 |            5 |            38 |         38 |              13 |
| Pleuronectidae  | *Platichthys flesus*           | European flounder        |          5 |          7 |              5 |               1 |          20 |           20 |           105 |        105 |             101 |
| Pleuronectidae  | *Pleuronectes platessa*        | European plaice          |          5 |          7 |              5 |               2 |          18 |           17 |           103 |        103 |             108 |
| Scophthalmidae  | *Lepidorhombus whiffiagonis*   | Megrim                   |          4 |          2 |              4 |               0 |           9 |            9 |            34 |         34 |              11 |
| Scophthalmidae  | *Phrynorhombus norvegicus*     | Norwegian topknot        |          3 |          1 |              3 |               0 |           4 |            4 |            10 |         10 |               5 |
| Scophthalmidae  | *Scophthalmus maximus*         | Turbot                   |          3 |          6 |              3 |               2 |          18 |           18 |           111 |        113 |              82 |
| Scophthalmidae  | *Scophthalmus rhombus*         | Brill                    |          5 |          5 |              5 |               2 |          14 |           14 |            30 |         30 |              18 |
| Scophthalmidae  | *Zeugopterus punctatus*        | Topknot                  |          3 |          3 |              3 |               3 |           5 |            5 |             8 |          8 |               6 |
| Scophthalmidae  | *Zeugopterus regius*           | Eckstr<f6>m’s topknot    |          3 |          0 |              3 |               0 |           0 |            0 |             0 |          0 |               0 |
| Soleidae        | *Buglossidium luteum*          | Solenette                |          5 |          2 |              5 |               0 |           8 |            8 |            37 |         37 |               8 |
| Soleidae        | *Microchirus variegatus*       | Thickback sole           |          3 |          2 |              3 |               0 |           5 |            5 |            35 |         35 |              11 |
| Soleidae        | *Pegusa lascaris*              | Sand sole                |          2 |          2 |              2 |               0 |           4 |            4 |             9 |          9 |              59 |
| Soleidae        | *Solea solea*                  | Common sole              |          7 |         11 |              7 |               2 |          24 |           24 |           162 |        162 |             252 |
| Salmonidae      | *Oncorhynchus mykiss*          | Rainbow trout            |         30 |         36 |             30 |              31 |          52 |           47 |           486 |        486 |              87 |
| Salmonidae      | *Salmo salar*                  | Atlantic salmon          |         13 |         31 |             13 |              14 |          25 |           20 |           429 |        431 |              34 |
| Salmonidae      | *Salmo trutta*                 | Sea trout                |         37 |         49 |             37 |              32 |          43 |           42 |           339 |        339 |             432 |
| Salmonidae      | *Thymallus thymallus*          | Grayling                 |         28 |         29 |             28 |              27 |          32 |           32 |           114 |        114 |              35 |
| Agonidae        | *Agonus cataphractus*          | Hooknose                 |          1 |          2 |              1 |               1 |           2 |            2 |            24 |         24 |               2 |
| Cottidae        | *Cottus gobio*                 | Bullhead                 |          3 |          3 |              3 |               2 |           6 |            6 |           114 |        114 |               7 |
| Cottidae        | *Micrenophrys lilljeborgii*    | Norway bullhead          |          1 |          1 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| Cottidae        | *Myoxocephalus scorpius*       | Shorthorn sculpin        |          9 |          6 |              9 |               6 |           6 |            6 |           104 |        104 |             111 |
| Cottidae        | *Taurulus bubalis*             | Longspined bullhead      |          7 |          6 |              7 |               3 |           7 |            7 |             6 |          6 |               4 |
| Cyclopteridae   | *Cyclopterus lumpus*           | Lumpfish                 |          3 |          5 |              3 |               2 |           6 |            6 |            71 |         71 |               7 |
| Liparidae       | *Liparis liparis*              | Striped seasnail         |          4 |          2 |              4 |               0 |           1 |            1 |            16 |         16 |               4 |
| Liparidae       | *Liparis montagui*             | Montagus seasnail        |          2 |          0 |              2 |               0 |           2 |            2 |             1 |          1 |               3 |
| Triglidae       | *Chelidonichthys cuculus*      | Red gurnard              |          4 |          0 |              4 |               0 |           1 |            1 |            51 |         51 |               8 |
| Triglidae       | *Chelidonichthys lastoviza*    | Streaked gurnard         |          3 |          0 |              3 |               0 |           8 |            8 |            35 |         35 |               4 |
| Triglidae       | *Chelidonichthys lucerna*      | Tub gurnard              |          5 |          3 |              5 |               1 |          17 |           16 |            71 |         71 |              11 |
| Triglidae       | *Eutrigla gurnardus*           | Grey gurnard             |          5 |          2 |              5 |               2 |           7 |            7 |            30 |         30 |               9 |
| Siluridae       | *Silurus glanis*               | Wels catfish             |          5 |          5 |              5 |               5 |           9 |            9 |            82 |         82 |               6 |
| Syngnathidae    | *Entelurus aequoreus*          | Snake pipefish           |          4 |          5 |              4 |               3 |           5 |            5 |            10 |         10 |             180 |
| Syngnathidae    | *Hippocampus guttulatus*       | Long-snouted seahorse    |          1 |          0 |              1 |               0 |           8 |            8 |             9 |          9 |               4 |
| Syngnathidae    | *Hippocampus hippocampus*      | Short snouted seahorse   |          8 |          4 |              8 |               4 |          24 |           24 |            10 |         10 |              18 |
| Syngnathidae    | *Nerophis lumbriciformis*      | Worm pipefish            |        125 |        120 |            125 |               1 |         120 |          120 |             3 |          3 |             119 |
| Syngnathidae    | *Nerophis ophidion*            | Straightnose pipefish    |          4 |          5 |              4 |               3 |           4 |            4 |             5 |          5 |               2 |
| Syngnathidae    | *Syngnathus acus*              | Greater pipefish         |          6 |         16 |              6 |               6 |           8 |            8 |            43 |         43 |              17 |
| Syngnathidae    | *Syngnathus rostellatus*       | Nilsson’s pipefish       |          5 |          5 |              5 |               3 |           5 |            5 |            14 |         14 |               3 |
| Syngnathidae    | *Syngnathus typhle*            | Broadnosed pipefish      |          5 |          7 |              5 |               4 |           6 |            6 |            50 |         50 |              38 |
| Balistidae      | *Balistes capriscus*           | Grey triggerfish         |          3 |          5 |              3 |               0 |           4 |            4 |            59 |         59 |               4 |
| Molidae         | *Mola mola*                    | Ocean sunfish            |          6 |          7 |              6 |               4 |          10 |            9 |            22 |         22 |              12 |
| Zeidae          | *Zeus faber*                   | John dory                |         12 |         10 |             12 |               8 |          27 |           25 |           124 |        124 |              21 |
| Petromyzontidae | *Lampetra fluviatilis*         | River lamprey            |          2 |          2 |              2 |               0 |           8 |           10 |            51 |         51 |              45 |
| Petromyzontidae | *Lampetra planeri*             | European brook lamprey   |          2 |          3 |              2 |               0 |          19 |           19 |            79 |         79 |             123 |
| Petromyzontidae | *Petromyzon marinus*           | Sea lamprey              |          4 |          3 |              4 |               0 |           7 |            7 |            58 |         58 |              10 |
| Carcharhinidae  | *Prionace glauca*              | Blue shark               |          6 |          8 |              6 |               8 |           9 |            7 |           871 |        875 |             310 |
| Scyliorhinidae  | *Scyliorhinus canicula*        | Lesser spotted dogfish   |          4 |          1 |              4 |               1 |           5 |            5 |           585 |        585 |              84 |
| Scyliorhinidae  | *Scyliorhinus stellaris*       | Nursehound               |          3 |          2 |              3 |               2 |           3 |            3 |            24 |         24 |               2 |
| Triakidae       | *Galeorhinus galeus*           | Tope shark               |          1 |          0 |              1 |               0 |           2 |            2 |            36 |         41 |               1 |
| Triakidae       | *Mustelus asterias*            | Starry smooth-hound      |          4 |          5 |              4 |               1 |           5 |            5 |            45 |         45 |               3 |
| Alopiidae       | *Alopias vulpinus*             | Thresher                 |          6 |          5 |              6 |               5 |           5 |            5 |            54 |         54 |               4 |
| Cetorhinidae    | *Cetorhinus maximus*           | Basking shark            |         25 |         24 |             25 |              24 |          25 |           25 |            89 |         89 |              25 |
| Lamnidae        | *Lamna nasus*                  | Porbeagle                |          3 |          5 |              3 |               5 |           3 |            3 |           134 |        134 |               3 |
| Dasyatidae      | *Dasyatis pastinaca*           | Common stingray          |          3 |          2 |              3 |               2 |           5 |            5 |            45 |         45 |               2 |
| Rajidae         | *Amblyraja radiata*            | Starry ray               |          3 |          4 |              3 |               3 |           4 |            4 |           212 |        212 |               2 |
| Rajidae         | *Leucoraja naevus*             | Cuckoo ray               |          4 |          4 |              4 |               4 |           5 |            4 |            45 |         45 |               6 |
| Rajidae         | *Raja brachyura*               | Blonde ray               |          5 |          5 |              5 |               5 |           8 |            7 |            63 |         63 |               9 |
| Rajidae         | *Raja clavata*                 | Thornback ray            |          6 |          6 |              6 |               4 |          12 |           11 |           212 |        212 |              16 |
| Rajidae         | *Raja microocellata*           | Small-eyed ray           |          2 |          2 |              2 |               2 |           3 |            2 |            14 |         14 |               1 |
| Rajidae         | *Raja montagui*                | Spotted ray              |          2 |          2 |              2 |               2 |           7 |            4 |            97 |         97 |               1 |
| Rajidae         | *Raja undulata*                | Undulate ray             |          6 |          4 |              6 |               4 |           5 |            4 |            15 |         15 |               3 |
| Squalidae       | *Squalus acanthias*            | Picked dogfish           |          4 |          5 |              4 |               5 |          16 |           14 |           280 |        280 |              16 |

**Table 3. Numbers of new sequences for latest reference library version
compared to previous. Current version is GenBank v251 (06 Oct 2022);
previous version is GenBank v249 (29 May 2022).**

| Scientific Name               | 12S (Miya) | 12S (Riaz) | 12S (Taberlet) | 12S (Valentini) | 16S (Berry) | 16S (Kitano) | COI (Lerayxt) | COI (Ward) | CYTB (Minamoto) |
| :---------------------------- | ---------: | ---------: | -------------: | --------------: | ----------: | -----------: | ------------: | ---------: | --------------: |
| *Abramis brama*               |          1 |          1 |              1 |               1 |           1 |            1 |             7 |          7 |               1 |
| *Acipenser ruthenus*          |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Alburnus alburnus*           |          0 |          0 |              0 |               0 |           0 |            0 |            37 |         37 |               0 |
| *Alopias vulpinus*            |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Ambloplites rupestris*       |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Amblyraja hyperborea*        |          0 |          0 |              0 |               0 |           0 |            0 |             6 |          6 |               0 |
| *Amblyraja radiata*           |          0 |          0 |              0 |               0 |           0 |            0 |             6 |          6 |               0 |
| *Ameiurus melas*              |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Ameiurus nebulosus*          |          3 |          3 |              3 |               3 |           3 |            3 |             9 |          9 |               3 |
| *Anguilla anguilla*           |          0 |          0 |              0 |               0 |           0 |            0 |             6 |          6 |               0 |
| *Anoplogaster cornuta*        |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Antimora rostrata*           |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Arctozenus risso*            |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Argentina sphyraena*         |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Argyropelecus hemigymnus*    |          0 |          0 |              0 |               0 |           0 |            0 |            10 |         10 |               0 |
| *Argyropelecus olfersii*      |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Atherina boyeri*             |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Auxis rochei*                |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Auxis thazard*               |          0 |          0 |              0 |               0 |           2 |            2 |             1 |          1 |               2 |
| *Avocettina infans*           |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Bajacalifornia megalops*     |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Barbatula barbatula*         |          0 |          0 |              0 |               0 |           0 |            0 |            18 |         18 |               0 |
| *Barbus barbus*               |          0 |          0 |              0 |               0 |           0 |            0 |            18 |         18 |               0 |
| *Bathyraja richardsoni*       |          0 |          0 |              0 |               0 |           0 |            0 |             6 |          6 |               0 |
| *Bathyraja spinicauda*        |          0 |          0 |              0 |               0 |           0 |            0 |            10 |         10 |               0 |
| *Bathysaurus ferox*           |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Benthosema glaciale*         |          0 |         56 |              0 |               0 |          56 |           56 |            56 |         56 |               0 |
| *Beryx decadactylus*          |          0 |          0 |              0 |               0 |           3 |            3 |            10 |         10 |               0 |
| *Blennius ocellaris*          |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Blicca bjoerkna*             |          0 |          0 |              0 |               0 |           0 |            0 |             7 |          7 |               0 |
| *Bonapartia pedaliota*        |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Borostomias antarcticus*     |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Brama brama*                 |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Brosme brosme*               |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Carassius auratus*           |          7 |          7 |              7 |               7 |           7 |            7 |            21 |         21 |               2 |
| *Carassius carassius*         |          0 |          0 |              0 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Carcharodon carcharias*      |          0 |          0 |              0 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Centrolophus niger*          |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Centrophorus granulosus*     |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Centrophorus squamosus*      |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Centroscymnus coelolepis*    |          0 |          0 |              0 |               0 |           0 |            0 |             6 |          6 |               0 |
| *Centroscymnus crepidater*    |          0 |          0 |              0 |               0 |           0 |            0 |             8 |          8 |               0 |
| *Centroscymnus owstonii*      |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Ceratias holboelli*          |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Ceratoscopelus maderensis*   |          0 |          0 |              0 |               0 |           0 |            0 |             9 |          9 |               0 |
| *Ceratoscopelus warmingii*    |          0 |          0 |              0 |               0 |           0 |            0 |            19 |         19 |               0 |
| *Cetorhinus maximus*          |          0 |          0 |              0 |               0 |           0 |            0 |             7 |          7 |               0 |
| *Chauliodus sloani*           |          0 |          0 |              0 |               0 |           0 |            0 |            14 |         14 |               0 |
| *Chelon auratus*              |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Chlamydoselachus anguineus*  |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Cichlasoma bimaculatum*      |          0 |          0 |              0 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Cobitis taenia*              |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Coptodon zillii*             |          0 |          0 |              0 |               0 |           2 |            2 |            11 |         11 |               0 |
| *Coregonus albula*            |          0 |          0 |              0 |               0 |          36 |           36 |            25 |         25 |               0 |
| *Coregonus autumnalis*        |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Coregonus lavaretus*         |          0 |          0 |              0 |               0 |           3 |            3 |             3 |          3 |               0 |
| *Coryphaenoides brevibarbis*  |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Cottus gobio*                |          0 |          0 |              0 |               0 |           0 |            0 |            24 |         24 |               0 |
| *Ctenolabrus rupestris*       |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Cyclothone braueri*          |          0 |          0 |              0 |               0 |           0 |            0 |            13 |         13 |               0 |
| *Cyclothone microdon*         |          0 |          0 |              0 |               0 |           0 |            0 |            10 |         10 |               0 |
| *Cyclothone obscura*          |          0 |          0 |              0 |               0 |           0 |            0 |             9 |          9 |               0 |
| *Cyprinus carpio*             |          3 |          3 |              3 |               3 |           3 |            3 |            47 |         47 |             556 |
| *Dalatias licha*              |          0 |          0 |              0 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Dasyatis pastinaca*          |          1 |          0 |              1 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Deania calcea*               |          1 |          1 |              1 |               1 |           0 |            0 |             8 |          8 |               0 |
| *Dentex maroccanus*           |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Diaphus dumerilii*           |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Diaphus metopoclampus*       |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Dipturus batis*              |          0 |          0 |              0 |               0 |           0 |            0 |            16 |         16 |               0 |
| *Diretmus argenteus*          |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Electrona risso*             |          0 |          0 |              0 |               0 |           0 |            0 |             9 |          9 |               0 |
| *Epigonus telescopus*         |          0 |          0 |              0 |               0 |           0 |            0 |             8 |          8 |               2 |
| *Esox lucius*                 |          1 |          1 |              1 |               1 |           1 |            1 |             5 |          5 |               1 |
| *Etmopterus princeps*         |          2 |          2 |              2 |               2 |           2 |            2 |             0 |          0 |               0 |
| *Euthynnus alletteratus*      |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Evermannella balbo*          |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Flagellostomias boureei*     |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Gadus morhua*                |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               3 |
| *Gaidropsarus argentatus*     |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               5 |
| *Gaidropsarus macrophthalmus* |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               5 |
| *Gaidropsarus mediterraneus*  |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               5 |
| *Gaidropsarus vulgaris*       |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               5 |
| *Galeorhinus galeus*          |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Gasterosteus aculeatus*      |          2 |          2 |              2 |               1 |           1 |            1 |            58 |         58 |              53 |
| *Gephyroberyx darwinii*       |          0 |          0 |              0 |               0 |           0 |            0 |             8 |          8 |               0 |
| *Gobio gobio*                 |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Gobius couchi*               |          0 |          0 |              0 |               0 |           1 |            1 |             3 |          3 |               0 |
| *Gobius niger*                |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Gymnocephalus cernua*        |          0 |          0 |              0 |               0 |           0 |            0 |             8 |          8 |               0 |
| *Halargyreus johnsonii*       |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Halosauropsis macrochir*     |          0 |          0 |              0 |               0 |           0 |            0 |            15 |         15 |               0 |
| *Harriotta raleighana*        |          0 |          0 |              0 |               0 |           0 |            0 |            11 |         11 |               0 |
| *Helicolenus dactylopterus*   |          0 |          0 |              0 |               0 |           3 |            3 |             0 |          0 |               0 |
| *Heptranchias perlo*          |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Hippocampus guttulatus*      |          0 |          0 |              0 |               0 |           1 |            1 |             1 |          1 |               0 |
| *Hippocampus hippocampus*     |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Hirundichthys rondeletii*    |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Holtbyrnia anomala*          |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Hoplostethus mediterraneus*  |          0 |          0 |              0 |               0 |           0 |            0 |            11 |         11 |               0 |
| *Ictalurus punctatus*         |          2 |          2 |              2 |               2 |           2 |            2 |            26 |         26 |              40 |
| *Istiophorus albicans*        |          2 |          0 |              2 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Isurus oxyrinchus*           |          2 |          0 |              2 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Katsuwonus pelamis*          |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |              10 |
| *Lagocephalus lagocephalus*   |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Lamna nasus*                 |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Lampadena speculigera*       |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Lampanyctus intricarius*     |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Lampanyctus macdonaldi*      |          0 |          0 |              0 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Lampetra planeri*            |          0 |          0 |              0 |               0 |           0 |            0 |             7 |          7 |               0 |
| *Lamprogrammus shcherbachevi* |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Lepidocybium flavobrunneum*  |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Lepidopus caudatus*          |          0 |          0 |              0 |               0 |           3 |            3 |            14 |         14 |               0 |
| *Lepomis gibbosus*            |          2 |          3 |              2 |               2 |           2 |            2 |            20 |         20 |               2 |
| *Lesueurigobius friesii*      |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Lethrinus nebulosus*         |          0 |          3 |              0 |               3 |           0 |            0 |             1 |          1 |               0 |
| *Leucaspius delineatus*       |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Leuciscus idus*              |          1 |          1 |              1 |               1 |           1 |            1 |             4 |          4 |               1 |
| *Leuciscus leuciscus*         |          0 |          0 |              0 |               0 |           0 |            0 |             8 |          8 |               0 |
| *Leucoraja circularis*        |          0 |          0 |              0 |               0 |           0 |            0 |            29 |         29 |               0 |
| *Leucoraja fullonica*         |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Leucoraja naevus*            |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Lota lota*                   |          0 |          0 |              0 |               0 |           0 |            0 |            16 |         16 |               0 |
| *Luvarus imperialis*          |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Macroramphosus scolopax*     |          0 |          0 |              0 |               0 |           0 |            0 |             6 |          6 |               0 |
| *Malacosteus niger*           |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Maurolicus muelleri*         |          0 |         56 |              0 |               0 |          56 |           56 |            56 |         56 |               0 |
| *Merluccius merluccius*       |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               3 |
| *Misgurnus fossilis*          |          0 |          0 |              0 |               0 |           0 |            0 |            12 |         12 |               0 |
| *Mobula mobular*              |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Mora moro*                   |          0 |          0 |              0 |               0 |           0 |            0 |             8 |          8 |               0 |
| *Mugil cephalus*              |          3 |          1 |              3 |               0 |           2 |            2 |             4 |          4 |               2 |
| *Mullus surmuletus*           |          0 |          0 |              0 |               0 |           1 |            1 |             0 |          0 |               0 |
| *Muraena helena*              |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Mustelus mustelus*           |          0 |          0 |              0 |               0 |           0 |            0 |            58 |         60 |               0 |
| *Myctophum nitidulum*         |          0 |          0 |              0 |               0 |           0 |            0 |             6 |          6 |               0 |
| *Narcetes stomias*            |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Neogobius melanostomus*      |          1 |          1 |              1 |               1 |           1 |            1 |            13 |         13 |               1 |
| *Neoscopelus macrolepidotus*  |          0 |          0 |              0 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Nessorhamphus ingolfianus*   |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Notacanthus bonaparte*       |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Notolychnus valdiviae*       |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Oncorhynchus gorbuscha*      |          0 |          0 |              0 |               0 |           0 |            0 |            22 |         22 |               0 |
| *Oncorhynchus mykiss*         |          9 |          9 |              9 |               9 |           9 |            9 |            28 |         28 |              11 |
| *Oneirodes eschrichtii*       |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Oreochromis niloticus*       |          0 |          0 |              0 |               0 |           2 |            2 |            16 |         16 |              63 |
| *Parablennius gattorugine*    |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Paralepis coregonoides*      |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Perca fluviatilis*           |          1 |          1 |              1 |               1 |           1 |            1 |            22 |         22 |               1 |
| *Phoxinus phoxinus*           |          0 |          0 |              0 |               0 |           0 |            0 |            93 |         93 |             530 |
| *Pimephales promelas*         |          7 |          7 |              7 |               7 |           7 |            7 |            16 |         16 |               2 |
| *Platichthys flesus*          |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |              23 |
| *Poecilia reticulata*         |          0 |          0 |              0 |               0 |           0 |            0 |            14 |         14 |               0 |
| *Polyprion americanus*        |          0 |          0 |              0 |               0 |           0 |            0 |             8 |          8 |               1 |
| *Pomatoschistus minutus*      |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Pomatoschistus norvegicus*   |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Prionace glauca*             |          0 |          1 |              0 |               1 |           0 |            0 |             6 |          6 |               0 |
| *Pseudorasbora parva*         |          1 |          1 |              1 |               1 |           0 |            0 |            11 |         11 |               0 |
| *Pseudotriakis microdon*      |          0 |          0 |              0 |               0 |           1 |            1 |             2 |          2 |               0 |
| *Pteroplatytrygon violacea*   |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Raja brachyura*              |          0 |          0 |              0 |               0 |           0 |            0 |            18 |         18 |               0 |
| *Raja clavata*                |          0 |          0 |              0 |               0 |           0 |            0 |            14 |         14 |               0 |
| *Raja microocellata*          |          0 |          0 |              0 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Raja miraletus*              |          0 |          0 |              0 |               0 |           0 |            0 |             6 |          6 |               0 |
| *Raja montagui*               |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Raja undulata*               |          1 |          0 |              1 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Rajella bathyphila*          |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Rajella fyllae*              |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Regalecus glesne*            |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Remora remora*               |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Rhadinesthes decimus*        |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Rhodeus amarus*              |          0 |          0 |              0 |               0 |           0 |            0 |            55 |         55 |               0 |
| *Rostroraja alba*             |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Rouleina attrita*            |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Rutilus rutilus*             |          0 |          0 |              0 |               0 |           0 |            0 |            21 |         21 |               0 |
| *Ruvettus pretiosus*          |          1 |          1 |              1 |               1 |           0 |            0 |             2 |          2 |               0 |
| *Salmo salar*                 |          0 |          0 |              0 |               0 |           0 |            0 |             8 |          8 |               0 |
| *Salmo trutta*                |         13 |         13 |             13 |              13 |          13 |           13 |            43 |         43 |              69 |
| *Salvelinus alpinus*          |          3 |          3 |              3 |               3 |           3 |            3 |             3 |          3 |               3 |
| *Salvelinus fontinalis*       |          6 |          6 |              6 |               6 |           6 |            6 |            26 |         26 |              10 |
| *Sander lucioperca*           |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Scardinius erythrophthalmus* |          0 |          0 |              0 |               0 |           0 |            0 |            13 |         13 |               0 |
| *Scomber scombrus*            |          0 |          0 |              0 |               0 |           0 |            0 |            11 |         11 |               0 |
| *Scomberesox saurus*          |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Scophthalmus maximus*        |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               3 |
| *Scorpaena porcus*            |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Scorpaena scrofa*            |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Scyliorhinus stellaris*      |          2 |          2 |              2 |               2 |           2 |            2 |             2 |          2 |               2 |
| *Seriola dumerili*            |          1 |          0 |              1 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Serrivomer beanii*           |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Sigmops bathyphilus*         |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Silurus glanis*              |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Simenchelys parasitica*      |          0 |          0 |              0 |               0 |           0 |            0 |            16 |         16 |               0 |
| *Spectrunculus grandis*       |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Sphoeroides pachygaster*     |          0 |          0 |              0 |               0 |           1 |            1 |             2 |          2 |               3 |
| *Sphyrna zygaena*             |          1 |          1 |              1 |               1 |           0 |            0 |             2 |          2 |               0 |
| *Squalius cephalus*           |          0 |          0 |              0 |               0 |           0 |            0 |            35 |         35 |               0 |
| *Squalus acanthias*           |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Sternoptyx diaphana*         |          0 |          0 |              0 |               0 |           0 |            0 |            11 |         11 |               0 |
| *Stomias boa*                 |          0 |          0 |              0 |               0 |           0 |            0 |             6 |          6 |               0 |
| *Taractichthys longipinnis*   |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Tetronarce nobiliana*        |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Thunnus alalunga*            |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Thunnus albacares*           |          1 |          3 |              1 |               3 |           0 |            0 |             2 |          2 |              10 |
| *Thymallus thymallus*         |          0 |          0 |              0 |               0 |           0 |            0 |            14 |         14 |               0 |
| *Tinca tinca*                 |          1 |          1 |              1 |               1 |           1 |            1 |             5 |          5 |               1 |
| *Trachinotus ovatus*          |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Trichiurus lepturus*         |          0 |          0 |              0 |               0 |           1 |            1 |            57 |         57 |             281 |
| *Trigonolampa miriceps*       |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Trisopterus luscus*          |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               3 |
| *Umbrina cirrosa*             |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Xenodermichthys copei*       |          0 |          0 |              0 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Xiphias gladius*             |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Zameus squamulosus*          |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Zeus faber*                  |          1 |          1 |              1 |               1 |           1 |            1 |             6 |          6 |               1 |
