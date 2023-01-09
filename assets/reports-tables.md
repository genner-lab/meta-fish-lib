Reference library coverage report
================
Rupert A. Collins
09 January 2023

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
NCBI GenBank and BOLD databases were searched on 07 Jan 2023 (GenBank
version 253), and the search retrieved 59503 accessions from 497 unique
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
| 12S   | Miya      |  3119 |       0.81 |          0.97 |        0.74 |       0.17 |         1.9 |             1 |
| 12S   | Riaz      |  3477 |       0.76 |          0.94 |        0.67 |       0.19 |         1.8 |             1 |
| 12S   | Taberlet  |  3119 |       0.81 |          0.97 |        0.74 |       0.17 |         1.9 |             1 |
| 12S   | Valentini |  2264 |       0.64 |          0.78 |        0.56 |       0.23 |         1.4 |             1 |
| 16S   | Berry     |  5330 |       0.79 |          0.97 |        0.71 |       0.14 |         3.6 |             2 |
| 16S   | Kitano    |  5276 |       0.80 |          0.97 |        0.72 |       0.15 |         2.7 |             2 |
| COI   | Lerayxt   | 34445 |       0.92 |          0.98 |        0.89 |       0.03 |        12.3 |             7 |
| COI   | Ward      | 34628 |       0.92 |          0.98 |        0.89 |       0.03 |        21.1 |            11 |
| CYTB  | Minamoto  | 20212 |       0.69 |          0.90 |        0.59 |       0.14 |         8.9 |             2 |

**Table 2. Numbers of sequences represented per species for each primer
set metabarcode fragment. Only common species are shown.**

| Family          | Scientific Name                | Common Name              | 12S (Miya) | 12S (Riaz) | 12S (Taberlet) | 12S (Valentini) | 16S (Berry) | 16S (Kitano) | COI (Lerayxt) | COI (Ward) | CYTB (Minamoto) |
| :-------------- | :----------------------------- | :----------------------- | ---------: | ---------: | -------------: | --------------: | ----------: | -----------: | ------------: | ---------: | --------------: |
| Anguillidae     | *Anguilla anguilla*            | European eel             |         64 |         67 |             64 |              60 |         230 |          248 |           244 |        244 |             148 |
| Congridae       | *Conger conger*                | European conger          |          3 |          0 |              3 |               0 |           2 |            2 |            34 |         34 |               0 |
| Atherinidae     | *Atherina boyeri*              | Big-scale sand smelt     |         11 |        170 |             11 |               2 |          68 |           68 |            37 |         37 |             103 |
| Belonidae       | *Belone belone*                | Garfish                  |          5 |          4 |              5 |               1 |           6 |            6 |            43 |         43 |               9 |
| Clupeidae       | *Alosa alosa*                  | Allis shad               |          2 |          2 |              2 |               2 |           4 |            4 |            32 |         32 |             197 |
| Clupeidae       | *Alosa fallax*                 | Twaite shad              |          3 |          6 |              3 |               6 |          10 |           10 |            18 |         18 |             520 |
| Clupeidae       | *Clupea harengus*              | Atlantic herring         |        107 |        115 |            107 |             109 |         120 |          119 |           191 |        191 |             196 |
| Clupeidae       | *Sardina pilchardus*           | European pilchard        |         11 |          7 |             11 |               4 |          34 |           32 |           236 |        241 |              99 |
| Clupeidae       | *Sprattus sprattus*            | European sprat           |          8 |          6 |              8 |               3 |          15 |           14 |            75 |         75 |              20 |
| Engraulidae     | *Engraulis encrasicolus*       | European anchovy         |          7 |         21 |              7 |               9 |          75 |           68 |           270 |        270 |            1070 |
| Cobitidae       | *Cobitis taenia*               | Spined loach             |          4 |          7 |              4 |               2 |           5 |            5 |            21 |         21 |             189 |
| Cyprinidae      | *Abramis brama*                | Freshwater bream         |          9 |          8 |              9 |               8 |           9 |            9 |           101 |        101 |              28 |
| Cyprinidae      | *Alburnus alburnus*            | Bleak                    |          5 |          6 |              5 |               5 |          12 |           12 |           250 |        251 |              39 |
| Cyprinidae      | *Barbus barbus*                | Barbel                   |          5 |          5 |              5 |               4 |           7 |            7 |           153 |        153 |              81 |
| Cyprinidae      | *Blicca bjoerkna*              | White bream              |          5 |          5 |              5 |               5 |          10 |           10 |            63 |         63 |               8 |
| Cyprinidae      | *Carassius auratus*            | Goldfish                 |         62 |         54 |             62 |              51 |          85 |           84 |           333 |        333 |             825 |
| Cyprinidae      | *Carassius carassius*          | Crucian carp             |          2 |          3 |              2 |               2 |           3 |            4 |            48 |         48 |             128 |
| Cyprinidae      | *Cyprinus carpio*              | Common carp              |         86 |         83 |             86 |              78 |         137 |          138 |           769 |        770 |            1070 |
| Cyprinidae      | *Gobio gobio*                  | Gudgeon                  |          5 |          4 |              5 |               4 |          12 |           12 |           130 |        130 |              45 |
| Cyprinidae      | *Leuciscus idus*               | Ide                      |          3 |          3 |              3 |               2 |           7 |            8 |            62 |         62 |              10 |
| Cyprinidae      | *Leuciscus leuciscus*          | Common dace              |          3 |          1 |              3 |               1 |          47 |           47 |           164 |        164 |             154 |
| Cyprinidae      | *Phoxinus phoxinus*            | Eurasian minnow          |         20 |         18 |             20 |              18 |          22 |           21 |          1326 |       1326 |             890 |
| Cyprinidae      | *Pseudorasbora parva*          | Stone moroko             |         19 |         13 |             19 |              12 |          47 |           44 |           279 |        279 |            1129 |
| Cyprinidae      | *Rutilus rutilus*              | Roach                    |          6 |         10 |              6 |               6 |          18 |           18 |           142 |        142 |             277 |
| Cyprinidae      | *Scardinius erythrophthalmus*  | Rudd                     |          5 |          5 |              5 |               4 |           8 |            8 |           108 |        108 |              28 |
| Cyprinidae      | *Squalius cephalus*            | Chub                     |          6 |          7 |              6 |               6 |          10 |           10 |           309 |        309 |             167 |
| Cyprinidae      | *Tinca tinca*                  | Tench                    |          9 |          9 |              9 |               8 |          13 |           13 |           179 |        179 |              36 |
| Nemacheilidae   | *Barbatula barbatula*          | Stone loach              |         10 |          9 |             10 |               9 |          12 |           12 |           160 |        160 |             345 |
| Esocidae        | *Esox lucius*                  | Northern pike            |         13 |         22 |             13 |              13 |          35 |           35 |           204 |        205 |             328 |
| Gadidae         | *Gadiculus argenteus*          | Silvery pout             |          4 |          4 |              4 |               2 |           7 |            7 |            38 |         38 |              11 |
| Gadidae         | *Gadus morhua*                 | Atlantic cod             |        172 |        178 |            172 |             170 |         184 |          184 |           531 |        532 |            1102 |
| Gadidae         | *Melanogrammus aeglefinus*     | Haddock                  |          9 |          7 |              9 |               7 |          12 |            9 |           246 |        247 |              44 |
| Gadidae         | *Merlangius merlangus*         | Whiting                  |         10 |         12 |             10 |               5 |          21 |           20 |           113 |        114 |              41 |
| Gadidae         | *Micromesistius poutassou*     | Blue whiting             |          8 |          6 |              8 |               4 |           8 |            7 |           111 |        111 |              22 |
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
| Gasterosteidae  | *Gasterosteus aculeatus*       | Three-spined stickleback |         21 |         21 |             21 |              15 |          26 |           26 |           354 |        354 |             565 |
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
| Carangidae      | *Trachurus trachurus*          | Atlantic horse mackerel  |          8 |          6 |              8 |               5 |          23 |           22 |           173 |        174 |              57 |
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
| Labridae        | *Labrus mixtus*                | Cuckoo wrasse            |          4 |          3 |              4 |               2 |           3 |            3 |            28 |         28 |               2 |
| Labridae        | *Symphodus bailloni*           | Baillon’s wrasse         |          6 |          3 |              6 |               1 |           3 |            3 |             3 |          3 |               0 |
| Labridae        | *Symphodus melops*             | Corkwing wrasse          |          7 |          5 |              7 |               2 |           6 |            6 |             6 |          6 |               1 |
| Moronidae       | *Dicentrarchus labrax*         | European seabass         |          6 |          9 |              6 |               3 |          14 |           13 |            65 |         65 |              27 |
| Mullidae        | *Mullus surmuletus*            | Surmullet                |          6 |          9 |              6 |               2 |          23 |           22 |            99 |         99 |              19 |
| Percidae        | *Gymnocephalus cernua*         | Ruffe                    |          8 |         11 |              8 |               8 |          15 |           15 |            99 |         99 |              12 |
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
| Pleuronectidae  | *Hippoglossoides platessoides* | American plaice          |          6 |          4 |              6 |               2 |           7 |            6 |            62 |         62 |              16 |
| Pleuronectidae  | *Hippoglossus hippoglossus*    | Atlantic halibut         |          6 |          6 |              6 |               5 |           7 |            8 |            31 |         31 |              15 |
| Pleuronectidae  | *Limanda limanda*              | Common dab               |          6 |          7 |              6 |               2 |          16 |           16 |            45 |         45 |              78 |
| Pleuronectidae  | *Microstomus kitt*             | Lemon sole               |          5 |          4 |              5 |               2 |           5 |            5 |            38 |         38 |              13 |
| Pleuronectidae  | *Platichthys flesus*           | European flounder        |          5 |          7 |              5 |               1 |          20 |           20 |           105 |        105 |             101 |
| Pleuronectidae  | *Pleuronectes platessa*        | European plaice          |          6 |          8 |              6 |               3 |          19 |           18 |           104 |        104 |             109 |
| Scophthalmidae  | *Lepidorhombus whiffiagonis*   | Megrim                   |          7 |          5 |              7 |               3 |           9 |            9 |            34 |         34 |              11 |
| Scophthalmidae  | *Phrynorhombus norvegicus*     | Norwegian topknot        |          3 |          1 |              3 |               0 |           4 |            4 |            10 |         10 |               5 |
| Scophthalmidae  | *Scophthalmus maximus*         | Turbot                   |          3 |          6 |              3 |               2 |          18 |           18 |           111 |        113 |              82 |
| Scophthalmidae  | *Scophthalmus rhombus*         | Brill                    |          5 |          5 |              5 |               2 |          14 |           14 |            30 |         30 |              18 |
| Scophthalmidae  | *Zeugopterus punctatus*        | Topknot                  |          3 |          3 |              3 |               3 |           5 |            5 |             8 |          8 |               6 |
| Scophthalmidae  | *Zeugopterus regius*           | Eckstr<f6>m’s topknot    |          3 |          0 |              3 |               0 |           0 |            0 |             0 |          0 |               0 |
| Soleidae        | *Buglossidium luteum*          | Solenette                |          5 |          2 |              5 |               0 |           8 |            8 |            37 |         37 |               8 |
| Soleidae        | *Microchirus variegatus*       | Thickback sole           |          4 |          3 |              4 |               1 |           5 |            5 |            35 |         35 |              11 |
| Soleidae        | *Pegusa lascaris*              | Sand sole                |          2 |          2 |              2 |               0 |           4 |            4 |             9 |          9 |              59 |
| Soleidae        | *Solea solea*                  | Common sole              |          7 |         11 |              7 |               2 |          24 |           24 |           162 |        162 |             252 |
| Salmonidae      | *Oncorhynchus mykiss*          | Rainbow trout            |         30 |         36 |             30 |              31 |          52 |           47 |           481 |        481 |              87 |
| Salmonidae      | *Salmo salar*                  | Atlantic salmon          |         13 |         31 |             13 |              14 |          25 |           20 |           428 |        430 |              34 |
| Salmonidae      | *Salmo trutta*                 | Sea trout                |         37 |         49 |             37 |              32 |          43 |           42 |           337 |        337 |             432 |
| Salmonidae      | *Thymallus thymallus*          | Grayling                 |         28 |         29 |             28 |              27 |          32 |           32 |           114 |        114 |              35 |
| Agonidae        | *Agonus cataphractus*          | Hooknose                 |          1 |          2 |              1 |               1 |           2 |            2 |            24 |         24 |               2 |
| Cottidae        | *Cottus gobio*                 | Bullhead                 |          3 |          3 |              3 |               2 |           6 |            6 |           114 |        114 |               8 |
| Cottidae        | *Micrenophrys lilljeborgii*    | Norway bullhead          |          1 |          1 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| Cottidae        | *Myoxocephalus scorpius*       | Shorthorn sculpin        |          9 |          6 |              9 |               6 |           6 |            6 |           104 |        104 |             112 |
| Cottidae        | *Taurulus bubalis*             | Longspined bullhead      |          7 |          6 |              7 |               3 |           7 |            7 |             6 |          6 |               4 |
| Cyclopteridae   | *Cyclopterus lumpus*           | Lumpfish                 |          5 |          6 |              5 |               3 |           7 |            7 |            72 |         72 |               8 |
| Liparidae       | *Liparis liparis*              | Striped seasnail         |          4 |          2 |              4 |               0 |           1 |            1 |            16 |         16 |               4 |
| Liparidae       | *Liparis montagui*             | Montagus seasnail        |          2 |          0 |              2 |               0 |           2 |            2 |             1 |          1 |               3 |
| Triglidae       | *Chelidonichthys cuculus*      | Red gurnard              |          6 |          2 |              6 |               2 |           1 |            1 |            51 |         51 |               8 |
| Triglidae       | *Chelidonichthys lastoviza*    | Streaked gurnard         |          3 |          0 |              3 |               0 |           8 |            8 |            35 |         35 |               4 |
| Triglidae       | *Chelidonichthys lucerna*      | Tub gurnard              |          6 |          4 |              6 |               2 |          17 |           16 |            71 |         71 |              11 |
| Triglidae       | *Eutrigla gurnardus*           | Grey gurnard             |          5 |          2 |              5 |               2 |           7 |            7 |            30 |         30 |               9 |
| Siluridae       | *Silurus glanis*               | Wels catfish             |          5 |          5 |              5 |               5 |           9 |            9 |            82 |         82 |               6 |
| Syngnathidae    | *Entelurus aequoreus*          | Snake pipefish           |          4 |          5 |              4 |               3 |           5 |            5 |            10 |         10 |             180 |
| Syngnathidae    | *Hippocampus guttulatus*       | Long-snouted seahorse    |          1 |          0 |              1 |               0 |           8 |            8 |             9 |          9 |               4 |
| Syngnathidae    | *Hippocampus hippocampus*      | Short snouted seahorse   |          8 |          4 |              8 |               4 |          24 |           24 |            10 |         10 |              18 |
| Syngnathidae    | *Nerophis lumbriciformis*      | Worm pipefish            |        125 |        120 |            125 |               0 |         120 |          120 |             3 |          3 |             119 |
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
| Carcharhinidae  | *Prionace glauca*              | Blue shark               |          6 |          8 |              6 |               8 |           9 |            7 |           881 |        885 |             310 |
| Scyliorhinidae  | *Scyliorhinus canicula*        | Lesser spotted dogfish   |          4 |          1 |              4 |               1 |           5 |            5 |           585 |        585 |              84 |
| Scyliorhinidae  | *Scyliorhinus stellaris*       | Nursehound               |          3 |          2 |              3 |               2 |           3 |            3 |            24 |         24 |               2 |
| Triakidae       | *Galeorhinus galeus*           | Tope shark               |          1 |          0 |              1 |               0 |           2 |            2 |            36 |         41 |               1 |
| Triakidae       | *Mustelus asterias*            | Starry smooth-hound      |          4 |          5 |              4 |               1 |           5 |            5 |            45 |         45 |               3 |
| Alopiidae       | *Alopias vulpinus*             | Thresher                 |          7 |          6 |              7 |               6 |           6 |            6 |            55 |         55 |               5 |
| Cetorhinidae    | *Cetorhinus maximus*           | Basking shark            |         25 |         24 |             25 |              24 |          25 |           25 |            89 |         89 |              25 |
| Lamnidae        | *Lamna nasus*                  | Porbeagle                |          4 |          6 |              4 |               6 |           4 |            4 |           135 |        135 |               4 |
| Dasyatidae      | *Dasyatis pastinaca*           | Common stingray          |          3 |          2 |              3 |               2 |           5 |            5 |            45 |         45 |               2 |
| Rajidae         | *Amblyraja radiata*            | Starry ray               |          4 |          4 |              4 |               3 |           4 |            4 |           212 |        212 |               2 |
| Rajidae         | *Leucoraja naevus*             | Cuckoo ray               |          4 |          4 |              4 |               4 |           5 |            4 |            45 |         45 |               6 |
| Rajidae         | *Raja brachyura*               | Blonde ray               |          5 |          5 |              5 |               5 |           8 |            7 |            63 |         63 |               9 |
| Rajidae         | *Raja clavata*                 | Thornback ray            |          6 |          6 |              6 |               4 |          12 |           11 |           212 |        212 |              16 |
| Rajidae         | *Raja microocellata*           | Small-eyed ray           |          2 |          2 |              2 |               2 |           3 |            2 |            14 |         14 |               1 |
| Rajidae         | *Raja montagui*                | Spotted ray              |          2 |          2 |              2 |               2 |           7 |            4 |            97 |         97 |               1 |
| Rajidae         | *Raja undulata*                | Undulate ray             |          6 |          4 |              6 |               4 |           5 |            4 |            15 |         15 |               3 |
| Squalidae       | *Squalus acanthias*            | Picked dogfish           |          4 |          5 |              4 |               5 |          21 |           19 |           280 |        280 |              16 |

**Table 3. Numbers of new sequences for latest reference library version
compared to previous. Current version is GenBank v253 (07 Jan 2023);
previous version is GenBank v251 (06 Oct 2022).**

| Scientific Name                | 12S (Miya) | 12S (Riaz) | 12S (Taberlet) | 12S (Valentini) | 16S (Berry) | 16S (Kitano) | COI (Lerayxt) | COI (Ward) | CYTB (Minamoto) |
| :----------------------------- | ---------: | ---------: | -------------: | --------------: | ----------: | -----------: | ------------: | ---------: | --------------: |
| *Acipenser ruthenus*           |          0 |          0 |              0 |               0 |           2 |            2 |             0 |          0 |               2 |
| *Alburnus alburnus*            |          2 |          2 |              2 |               2 |           2 |            2 |             2 |          2 |               2 |
| *Alepisaurus ferox*            |          2 |          2 |              2 |               2 |           2 |            2 |             4 |          4 |               2 |
| *Alopias vulpinus*             |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Ambloplites rupestris*        |          3 |          3 |              3 |               3 |           3 |            3 |             3 |          3 |               2 |
| *Amblyraja jenseni*            |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Amblyraja radiata*            |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Ameiurus melas*               |          2 |          2 |              2 |               2 |           2 |            2 |             2 |          2 |               2 |
| *Ameiurus nebulosus*           |          5 |          5 |              5 |               5 |           5 |            5 |             5 |          5 |               5 |
| *Anguilla anguilla*            |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               7 |
| *Antimora rostrata*            |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Apristurus laurussonii*       |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Arctozenus risso*             |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Argyropelecus olfersii*       |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Argyrosomus regius*           |          1 |          1 |              1 |               1 |           0 |            0 |             0 |          0 |               0 |
| *Artediellus atlanticus*       |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Atherina boyeri*              |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Barbatula barbatula*          |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Bathyraja spinicauda*         |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Benthosema glaciale*          |          1 |          1 |              1 |               1 |           0 |            0 |             0 |          0 |               0 |
| *Borostomias antarcticus*      |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Carassius auratus*            |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |              24 |
| *Centrophorus granulosus*      |          0 |          0 |              0 |               0 |           3 |            3 |             3 |          3 |               0 |
| *Centrophorus squamosus*       |          0 |          0 |              0 |               0 |          12 |           12 |            13 |         13 |               0 |
| *Centroscyllium fabricii*      |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Centroscymnus coelolepis*     |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Ceratias holboelli*           |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Ceratoscopelus maderensis*    |          2 |          2 |              2 |               2 |           0 |            0 |             0 |          0 |               0 |
| *Ceratoscopelus warmingii*     |          3 |          3 |              3 |               3 |           0 |            0 |             0 |          0 |               0 |
| *Chauliodus sloani*            |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Chelidonichthys cuculus*      |          2 |          2 |              2 |               2 |           0 |            0 |             0 |          0 |               0 |
| *Chelidonichthys lucerna*      |          1 |          1 |              1 |               1 |           0 |            0 |             0 |          0 |               0 |
| *Chiasmodon niger*             |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Clupea harengus*              |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Coptodon zillii*              |          0 |          0 |              0 |               0 |           0 |            0 |            19 |         19 |               0 |
| *Coryphaenoides rupestris*     |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Cottunculus thomsonii*        |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Cottus gobio*                 |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               1 |
| *Cyclopterus lumpus*           |          2 |          1 |              2 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Cyclothone microdon*          |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Cyprinus carpio*              |          8 |          8 |              8 |               8 |           8 |            8 |             9 |          9 |             338 |
| *Engraulis encrasicolus*       |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |              54 |
| *Esox lucius*                  |          3 |          3 |              3 |               3 |           3 |            3 |             3 |          3 |               2 |
| *Flagellostomias boureei*      |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Gaidropsarus argentatus*      |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Galeorhinus galeus*           |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Gasterosteus aculeatus*       |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |              23 |
| *Guttigadus latifrons*         |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Gymnocephalus cernua*         |          3 |          3 |              3 |               3 |           3 |            3 |             3 |          3 |               3 |
| *Hexanchus griseus*            |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Hippoglossoides platessoides* |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Holtbyrnia anomala*           |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Holtbyrnia macrops*           |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Icelus bicornis*              |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Ictalurus punctatus*          |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Labrus mixtus*                |          2 |          2 |              2 |               2 |           0 |            0 |             0 |          0 |               0 |
| *Lagocephalus lagocephalus*    |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Lamna nasus*                  |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Lampanyctus intricarius*      |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Lampanyctus pusillus*         |          4 |          4 |              4 |               4 |           0 |            0 |             0 |          0 |               0 |
| *Lepidion eques*               |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Lepidorhombus whiffiagonis*   |          3 |          3 |              3 |               3 |           0 |            0 |             0 |          0 |               0 |
| *Lepomis gibbosus*             |          2 |          2 |              2 |               2 |           2 |            2 |            14 |         14 |               2 |
| *Lethrinus nebulosus*          |          0 |          0 |              0 |               0 |           1 |            1 |             0 |          0 |               0 |
| *Leuciscus leuciscus*          |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Lycodes eudipleurostictus*    |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Lycodes pallidus*             |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Lycodes squamiventer*         |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Lycodes vahlii*               |          3 |          0 |              3 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Lycodonus flagellicauda*      |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Macrourus berglax*            |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Magnisudis atlantica*         |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Malacosteus niger*            |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Maulisia mauli*               |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Melanogrammus aeglefinus*     |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Microchirus variegatus*       |          1 |          1 |              1 |               1 |           0 |            0 |             0 |          0 |               0 |
| *Micromesistius poutassou*     |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Misgurnus fossilis*           |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Molva dypterygia*             |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Mugil cephalus*               |          1 |          0 |              1 |               0 |           8 |            8 |            13 |         13 |               0 |
| *Mullus barbatus*              |          0 |          0 |              0 |               0 |           0 |            0 |            79 |         79 |              76 |
| *Myctophum punctatum*          |          4 |          3 |              4 |               3 |           0 |            0 |             0 |          0 |               0 |
| *Myoxocephalus scorpius*       |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               1 |
| *Neogobius melanostomus*       |          4 |          4 |              4 |               4 |           4 |            4 |             4 |          4 |               4 |
| *Notacanthus chemnitzii*       |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Notolychnus valdiviae*        |          3 |          3 |              3 |               3 |           0 |            0 |             0 |          0 |               0 |
| *Notoscopelus elongatus*       |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Oncorhynchus gorbuscha*       |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Oreochromis niloticus*        |          0 |          0 |              0 |               0 |           0 |            0 |            89 |         89 |               0 |
| *Oxynotus centrina*            |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Paraliparis bathybius*        |          3 |          0 |              3 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Phoxinus phoxinus*            |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Pleuronectes platessa*        |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Poecilia reticulata*          |          0 |          0 |              0 |               0 |           1 |            1 |             1 |          1 |               0 |
| *Prionace glauca*              |          0 |          0 |              0 |               0 |           0 |            0 |            10 |         10 |               0 |
| *Pseudorasbora parva*          |          4 |          3 |              4 |               3 |           0 |            0 |             1 |          1 |               0 |
| *Rajella bathyphila*           |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Rajella fyllae*               |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Rhadinesthes decimus*         |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Rhinochimaera atlantica*      |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Rutilus rutilus*              |          3 |          3 |              3 |               3 |           3 |            3 |             3 |          3 |               3 |
| *Salvelinus fontinalis*        |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               2 |
| *Sarda sarda*                  |          1 |          1 |              1 |               1 |           0 |            0 |             0 |          0 |               0 |
| *Scopelogadus beanii*          |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Scopelosaurus lepidus*        |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Searsia koefoedi*             |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Sebastes norvegicus*          |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Seriola dumerili*             |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Serrivomer beanii*            |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Somniosus microcephalus*      |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Squalius cephalus*            |          2 |          2 |              2 |               2 |           2 |            2 |             2 |          2 |               2 |
| *Squalus acanthias*            |          0 |          0 |              0 |               0 |           5 |            5 |             0 |          0 |               0 |
| *Sternoptyx diaphana*          |          1 |          1 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Stomias boa*                  |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Symphodus melops*             |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Synaphobranchus kaupii*       |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Tetronarce nobiliana*         |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Trachurus trachurus*          |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |              22 |
| *Trachyrincus murrayi*         |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Trichiurus lepturus*          |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Umbrina cirrosa*              |          1 |          1 |              1 |               1 |           0 |            0 |             0 |          0 |               0 |
