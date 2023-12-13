Reference library coverage report
================
Rupert A. Collins
12 December 2023

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

The total number of accepted UK species is estimated to be around 532,
with 176 common species, and 4283 total names including synonyms. The
NCBI GenBank and BOLD databases were searched on 10 Dec 2023 (GenBank
version 258), and the search retrieved 61637 accessions from 498 unique
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
| 12S   | Miya      |  3708 |       0.82 |          0.97 |        0.75 |       0.13 |         2.0 |             1 |
| 12S   | Riaz      |  3831 |       0.78 |          0.95 |        0.69 |       0.16 |         1.9 |             1 |
| 12S   | Taberlet  |  3708 |       0.82 |          0.97 |        0.75 |       0.13 |         2.0 |             1 |
| 12S   | Valentini |  2586 |       0.67 |          0.82 |        0.59 |       0.19 |         1.4 |             1 |
| 16S   | Berry     |  5669 |       0.82 |          0.98 |        0.74 |       0.14 |         3.4 |             2 |
| 16S   | Kitano    |  5612 |       0.83 |          0.98 |        0.75 |       0.14 |         2.6 |             2 |
| COI   | Lerayxt   | 36250 |       0.93 |          0.98 |        0.90 |       0.02 |        12.6 |             7 |
| COI   | Ward      | 36433 |       0.93 |          0.98 |        0.90 |       0.02 |        21.6 |            11 |
| CYTB  | Minamoto  | 20387 |       0.73 |          0.92 |        0.64 |       0.15 |         8.4 |             2 |

**Table 2. Numbers of sequences represented per species for each primer
set metabarcode fragment. Only common species are shown.**

| Family          | Scientific Name                | Common Name              | 12S (Miya) | 12S (Riaz) | 12S (Taberlet) | 12S (Valentini) | 16S (Berry) | 16S (Kitano) | COI (Lerayxt) | COI (Ward) | CYTB (Minamoto) |
| :-------------- | :----------------------------- | :----------------------- | ---------: | ---------: | -------------: | --------------: | ----------: | -----------: | ------------: | ---------: | --------------: |
| Anguillidae     | *Anguilla anguilla*            | European eel             |         64 |         67 |             64 |              60 |         230 |          248 |           248 |        248 |             182 |
| Congridae       | *Conger conger*                | European conger          |          4 |          1 |              4 |               1 |           3 |            3 |            35 |         35 |               1 |
| Atherinidae     | *Atherina boyeri*              | Big-scale sand smelt     |         11 |        170 |             11 |               2 |          68 |           68 |            40 |         40 |             103 |
| Belonidae       | *Belone belone*                | Garfish                  |          5 |          4 |              5 |               1 |           7 |            7 |            45 |         45 |               9 |
| Clupeidae       | *Alosa alosa*                  | Allis shad               |          2 |          2 |              2 |               2 |           4 |            4 |            32 |         32 |             197 |
| Clupeidae       | *Alosa fallax*                 | Twaite shad              |          3 |          6 |              3 |               6 |          10 |           10 |            18 |         18 |             520 |
| Clupeidae       | *Clupea harengus*              | Atlantic herring         |        113 |        115 |            113 |             109 |         120 |          119 |           191 |        191 |             196 |
| Clupeidae       | *Sardina pilchardus*           | European pilchard        |         11 |          7 |             11 |               4 |          34 |           32 |           239 |        244 |              99 |
| Clupeidae       | *Sprattus sprattus*            | European sprat           |          9 |          7 |              9 |               4 |          16 |           15 |            79 |         79 |              21 |
| Engraulidae     | *Engraulis encrasicolus*       | European anchovy         |          7 |         21 |              7 |               9 |          75 |           68 |           270 |        270 |            1070 |
| Cobitidae       | *Cobitis taenia*               | Spined loach             |          5 |          7 |              5 |               2 |           5 |            5 |            21 |         21 |             192 |
| Cyprinidae      | *Abramis brama*                | Freshwater bream         |         10 |          8 |             10 |               8 |           9 |            9 |           101 |        101 |              28 |
| Cyprinidae      | *Alburnus alburnus*            | Bleak                    |          7 |          6 |              7 |               5 |          12 |           12 |           255 |        256 |              39 |
| Cyprinidae      | *Barbus barbus*                | Barbel                   |          5 |          5 |              5 |               4 |           7 |            7 |           154 |        154 |              84 |
| Cyprinidae      | *Blicca bjoerkna*              | White bream              |          5 |          5 |              5 |               5 |          10 |           10 |            64 |         64 |               8 |
| Cyprinidae      | *Carassius auratus*            | Goldfish                 |        108 |         95 |            108 |              93 |         129 |          128 |           404 |        404 |             877 |
| Cyprinidae      | *Carassius carassius*          | Crucian carp             |          4 |          4 |              4 |               3 |           4 |            5 |            49 |         49 |             129 |
| Cyprinidae      | *Cyprinus carpio*              | Common carp              |        114 |        104 |            114 |              98 |         164 |          164 |           829 |        830 |            1091 |
| Cyprinidae      | *Gobio gobio*                  | Gudgeon                  |          7 |          5 |              7 |               5 |          13 |           13 |           135 |        135 |              46 |
| Cyprinidae      | *Leuciscus idus*               | Ide                      |          3 |          3 |              3 |               2 |           7 |            8 |            63 |         63 |              10 |
| Cyprinidae      | *Leuciscus leuciscus*          | Common dace              |          4 |          1 |              4 |               1 |          47 |           47 |           164 |        164 |             154 |
| Cyprinidae      | *Phoxinus phoxinus*            | Eurasian minnow          |         23 |         20 |             23 |              20 |          23 |           22 |          1331 |       1331 |             891 |
| Cyprinidae      | *Pseudorasbora parva*          | Stone moroko             |         19 |         13 |             19 |              12 |          47 |           44 |           303 |        303 |            1130 |
| Cyprinidae      | *Rutilus rutilus*              | Roach                    |          9 |         12 |              9 |               8 |          20 |           20 |           149 |        149 |             279 |
| Cyprinidae      | *Scardinius erythrophthalmus*  | Rudd                     |          6 |          5 |              6 |               4 |           8 |            8 |           112 |        112 |              28 |
| Cyprinidae      | *Squalius cephalus*            | Chub                     |          8 |          8 |              8 |               7 |          11 |           11 |           313 |        313 |             170 |
| Cyprinidae      | *Tinca tinca*                  | Tench                    |         13 |         12 |             13 |               9 |          14 |           14 |           182 |        182 |              37 |
| Nemacheilidae   | *Barbatula barbatula*          | Stone loach              |         13 |          9 |             13 |               9 |          12 |           12 |           161 |        161 |             345 |
| Esocidae        | *Esox lucius*                  | Northern pike            |         14 |         22 |             14 |              13 |          35 |           35 |           204 |        205 |             332 |
| Gadidae         | *Gadiculus argenteus*          | Silvery pout             |          4 |          4 |              4 |               2 |           7 |            7 |            38 |         38 |              11 |
| Gadidae         | *Gadus morhua*                 | Atlantic cod             |        297 |        300 |            297 |             292 |         306 |          306 |           654 |        655 |            1224 |
| Gadidae         | *Melanogrammus aeglefinus*     | Haddock                  |         10 |          7 |             10 |               7 |          12 |            9 |           246 |        247 |              44 |
| Gadidae         | *Merlangius merlangus*         | Whiting                  |         10 |         12 |             10 |               5 |          21 |           20 |           113 |        114 |              41 |
| Gadidae         | *Micromesistius poutassou*     | Blue whiting             |          8 |          6 |              8 |               4 |           8 |            7 |           111 |        111 |              22 |
| Gadidae         | *Pollachius pollachius*        | Pollack                  |          8 |          6 |              8 |               5 |           3 |            3 |            18 |         18 |              13 |
| Gadidae         | *Pollachius virens*            | Saithe                   |         10 |          9 |             10 |               5 |           7 |            6 |            85 |         85 |              27 |
| Gadidae         | *Raniceps raninus*             | Tadpole fish             |          5 |          2 |              5 |               2 |           5 |            5 |             3 |          3 |               1 |
| Gadidae         | *Trisopterus esmarkii*         | Norway pout              |          3 |          4 |              3 |               2 |           4 |            4 |            36 |         36 |              10 |
| Gadidae         | *Trisopterus luscus*           | Pouting                  |          5 |          6 |              5 |               2 |           5 |            5 |            26 |         26 |              23 |
| Gadidae         | *Trisopterus minutus*          | Poor cod                 |          8 |          8 |              8 |               2 |           9 |            9 |            35 |         35 |              42 |
| Lotidae         | *Ciliata mustela*              | Fivebeard rockling       |          5 |          7 |              5 |               0 |           6 |            6 |            22 |         22 |              92 |
| Lotidae         | *Ciliata septentrionalis*      | Northern rockling        |          3 |          0 |              3 |               0 |           0 |            0 |             0 |          0 |               2 |
| Lotidae         | *Enchelyopus cimbrius*         | Fourbeard rockling       |          5 |          4 |              5 |               1 |           7 |            7 |            43 |         43 |              13 |
| Lotidae         | *Gaidropsarus mediterraneus*   | Shore rockling           |          0 |          7 |              0 |               0 |           6 |            6 |            17 |         17 |              12 |
| Lotidae         | *Gaidropsarus vulgaris*        | Three-bearded rockling   |          0 |          3 |              0 |               0 |           4 |            4 |            25 |         25 |               9 |
| Lotidae         | *Molva molva*                  | Ling                     |          3 |          2 |              3 |               2 |           3 |            3 |            22 |         22 |              21 |
| Merlucciidae    | *Merluccius merluccius*        | European hake            |          5 |         11 |              5 |               3 |          33 |           32 |           451 |        451 |             102 |
| Gasterosteidae  | *Gasterosteus aculeatus*       | Three-spined stickleback |         30 |         23 |             30 |              17 |          26 |           26 |           358 |        358 |             565 |
| Gasterosteidae  | *Pungitius pungitius*          | Ninespine stickleback    |         12 |         30 |             12 |              12 |          49 |           49 |           165 |        165 |             322 |
| Gasterosteidae  | *Spinachia spinachia*          | Sea stickleback          |          5 |          6 |              5 |               4 |           6 |            6 |             7 |          7 |               4 |
| Gobiesocidae    | *Apletodon dentatus*           | Small-headed clingfish   |          1 |          4 |              1 |               0 |           3 |            3 |             1 |          1 |               0 |
| Gobiesocidae    | *Diplecogaster bimaculata*     | Two-spotted clingfish    |          2 |          2 |              2 |               0 |           1 |            1 |             5 |          5 |               0 |
| Gobiesocidae    | *Lepadogaster candolii*        | Connemarra clingfish     |          0 |          6 |              0 |               0 |           4 |            4 |             2 |          2 |               0 |
| Gobiesocidae    | *Lepadogaster purpurea*        | Cornish sucker           |          2 |         12 |              2 |               0 |           1 |            1 |             6 |          6 |               0 |
| Lophiidae       | *Lophius piscatorius*          | Angler                   |          6 |          4 |              6 |               3 |          11 |           12 |            91 |         91 |              24 |
| Mugilidae       | *Chelon auratus*               | Golden grey mullet       |          4 |          8 |              4 |               2 |          19 |           19 |            68 |         68 |              18 |
| Mugilidae       | *Chelon labrosus*              | Thicklip grey mullet     |          9 |         12 |              9 |               6 |          17 |           17 |            33 |         33 |              15 |
| Mugilidae       | *Chelon ramada*                | Thinlip grey mullet      |          7 |         10 |              7 |               1 |          12 |           12 |            57 |         57 |              10 |
| Osmeridae       | *Osmerus eperlanus*            | European smelt           |          5 |          9 |              5 |               5 |          11 |           11 |            37 |         37 |              22 |
| Ammodytidae     | *Ammodytes marinus*            | Lesser sand-eel          |          6 |          9 |              6 |               3 |           2 |            2 |            53 |         53 |               2 |
| Ammodytidae     | *Ammodytes tobianus*           | Small sandeel            |          7 |          4 |              7 |               2 |           2 |            2 |            17 |         17 |               1 |
| Ammodytidae     | *Gymnammodytes semisquamatus*  | Smooth sandeel           |          3 |          2 |              3 |               2 |           2 |            2 |             2 |          2 |               2 |
| Ammodytidae     | *Hyperoplus immaculatus*       | Greater sand-eel         |          3 |          2 |              3 |               2 |           1 |            1 |            11 |         11 |               1 |
| Ammodytidae     | *Hyperoplus lanceolatus*       | Great sandeel            |          6 |          3 |              6 |               2 |           3 |            3 |            39 |         39 |               2 |
| Anarhichadidae  | *Anarhichas lupus*             | Atlantic wolffish        |         90 |         89 |             90 |              89 |          93 |           93 |           196 |        196 |              95 |
| Blenniidae      | *Blennius ocellaris*           | Butterfly blenny         |          5 |          3 |              5 |               1 |           5 |            5 |            26 |         26 |               1 |
| Blenniidae      | *Coryphoblennius galerita*     | Montagu’s blenny         |          3 |         63 |              3 |               1 |          69 |           69 |             8 |          8 |               1 |
| Blenniidae      | *Lipophrys pholis*             | Shanny                   |          7 |         16 |              7 |               2 |          11 |           11 |             9 |          9 |               1 |
| Blenniidae      | *Parablennius gattorugine*     | Tompot blenny            |          1 |          5 |              1 |               0 |           8 |            8 |             4 |          4 |               0 |
| Callionymidae   | *Callionymus lyra*             | Dragonet                 |          3 |          2 |              3 |               0 |           5 |            5 |            37 |         37 |               0 |
| Callionymidae   | *Callionymus maculatus*        |                          |          5 |          0 |              5 |               0 |           1 |            1 |            12 |         12 |               0 |
| Callionymidae   | *Callionymus reticulatus*      | Reticulated dragonet     |          1 |          0 |              1 |               0 |           0 |            0 |            11 |         11 |               0 |
| Caproidae       | *Capros aper*                  | Boarfish                 |          3 |          4 |              3 |               2 |           6 |            6 |            33 |         33 |               2 |
| Carangidae      | *Trachurus trachurus*          | Atlantic horse mackerel  |          8 |          6 |              8 |               5 |          23 |           22 |           184 |        185 |              57 |
| Cepolidae       | *Cepola macrophthalma*         | Red bandfish             |          6 |          0 |              6 |               0 |           1 |            1 |            27 |         27 |               0 |
| Gobiidae        | *Aphia minuta*                 | Transparent goby         |          4 |          5 |              4 |               3 |          15 |           15 |            24 |         24 |              12 |
| Gobiidae        | *Crystallogobius linearis*     | Crystal goby             |          2 |          3 |              2 |               3 |           4 |            4 |            12 |         12 |               1 |
| Gobiidae        | *Gobius cobitis*               | Giant goby               |          2 |          2 |              2 |               2 |           2 |            2 |            11 |         11 |               1 |
| Gobiidae        | *Gobius niger*                 | Black goby               |          7 |          6 |              7 |               4 |          18 |           18 |            82 |         82 |               6 |
| Gobiidae        | *Gobius paganellus*            | Rock goby                |          5 |          2 |              5 |               1 |           7 |            7 |            31 |         31 |               1 |
| Gobiidae        | *Gobiusculus flavescens*       | Two-spotted goby         |          3 |          4 |              3 |               3 |           6 |            6 |            17 |         17 |               5 |
| Gobiidae        | *Lesueurigobius friesii*       | Fries’s goby             |          3 |          3 |              3 |               3 |           6 |            6 |             6 |          6 |               2 |
| Gobiidae        | *Pomatoschistus lozanoi*       | Lozano’s goby            |          0 |          2 |              0 |               0 |           1 |            1 |             8 |          8 |               3 |
| Gobiidae        | *Pomatoschistus microps*       | Common goby              |          9 |          6 |              9 |               2 |           4 |            4 |            17 |         17 |              39 |
| Gobiidae        | *Pomatoschistus minutus*       | Sand goby                |          9 |          8 |              9 |               4 |          10 |           10 |            18 |         18 |             137 |
| Gobiidae        | *Pomatoschistus norvegicus*    | Norway goby              |          0 |          1 |              0 |               0 |           2 |            2 |            11 |         11 |               0 |
| Gobiidae        | *Pomatoschistus pictus*        | Painted goby             |          6 |          2 |              6 |               0 |           2 |            2 |            15 |         15 |               0 |
| Gobiidae        | *Thorogobius ephippiatus*      | Leopard-spotted goby     |          0 |          1 |              0 |               1 |           1 |            1 |             4 |          4 |               1 |
| Labridae        | *Centrolabrus exoletus*        | Rock cook                |          4 |          5 |              4 |               3 |           7 |            7 |             6 |          6 |               3 |
| Labridae        | *Ctenolabrus rupestris*        | Goldsinny-wrasse         |          8 |          6 |              8 |               4 |           6 |            6 |            15 |         15 |               5 |
| Labridae        | *Labrus bergylta*              | Ballan wrasse            |          6 |          5 |              6 |               2 |           6 |            6 |           163 |        165 |               5 |
| Labridae        | *Labrus mixtus*                | Cuckoo wrasse            |          5 |          4 |              5 |               3 |           4 |            4 |            29 |         29 |               3 |
| Labridae        | *Symphodus bailloni*           | Baillon’s wrasse         |          6 |          3 |              6 |               1 |           3 |            3 |             3 |          3 |               0 |
| Labridae        | *Symphodus melops*             | Corkwing wrasse          |          7 |          5 |              7 |               2 |           6 |            6 |             7 |          7 |               1 |
| Moronidae       | *Dicentrarchus labrax*         | European seabass         |          6 |          9 |              6 |               3 |          14 |           13 |            67 |         67 |              27 |
| Mullidae        | *Mullus surmuletus*            | Surmullet                |          6 |          9 |              6 |               2 |          23 |           22 |           105 |        105 |              19 |
| Percidae        | *Gymnocephalus cernua*         | Ruffe                    |          9 |         11 |              9 |               8 |          15 |           15 |           100 |        100 |              12 |
| Percidae        | *Perca fluviatilis*            | European perch           |         24 |         17 |             24 |              12 |          43 |           44 |           191 |        191 |              56 |
| Percidae        | *Sander lucioperca*            | Pike-perch               |          6 |          4 |              6 |               4 |           7 |            8 |           104 |        104 |              38 |
| Pholidae        | *Pholis gunnellus*             | Rock gunnel              |         10 |         10 |             10 |               7 |           7 |            7 |            27 |         27 |               3 |
| Scombridae      | *Scomber scombrus*             | Atlantic mackerel        |         11 |         29 |             11 |               4 |          17 |           16 |           452 |        452 |              79 |
| Sparidae        | *Pagellus bogaraveo*           | Blackspot seabream       |          3 |          3 |              3 |               2 |           3 |            3 |            20 |         28 |              16 |
| Sparidae        | *Pagrus pagrus*                | Red porgy                |          5 |          3 |              5 |               2 |           7 |            7 |           152 |        156 |              29 |
| Sparidae        | *Sparus aurata*                | Gilthead seabream        |          8 |          7 |              8 |               3 |          16 |           15 |           267 |        267 |              70 |
| Sparidae        | *Spondyliosoma cantharus*      | Black seabream           |          3 |          1 |              3 |               0 |           4 |            4 |            55 |         55 |              77 |
| Stichaeidae     | *Chirolophis ascanii*          | Yarrell’s blenny         |          2 |          2 |              2 |               2 |           2 |            2 |             2 |          2 |               2 |
| Stichaeidae     | *Lumpenus lampretaeformis*     | Snakeblenny              |          3 |          2 |              3 |               2 |           2 |            2 |            33 |         33 |              65 |
| Trachinidae     | *Echiichthys vipera*           | Lesser weever            |          6 |          5 |              6 |               3 |           4 |            4 |            21 |         21 |               5 |
| Trachinidae     | *Trachinus draco*              | Greater weever           |          4 |          3 |              4 |               1 |           7 |            7 |            34 |         34 |               7 |
| Zoarcidae       | *Zoarces viviparus*            | Eelpout                  |          2 |          2 |              2 |               0 |           5 |            5 |             7 |          7 |              82 |
| Bothidae        | *Arnoglossus laterna*          | Mediterranean scaldfish  |          6 |          7 |              6 |               0 |          10 |           10 |            63 |         63 |               1 |
| Pleuronectidae  | *Glyptocephalus cynoglossus*   | Witch flounder           |          4 |          3 |              4 |               3 |           4 |            4 |            60 |         60 |              17 |
| Pleuronectidae  | *Hippoglossoides platessoides* | American plaice          |          6 |          4 |              6 |               2 |           7 |            6 |            62 |         62 |              16 |
| Pleuronectidae  | *Hippoglossus hippoglossus*    | Atlantic halibut         |          6 |          6 |              6 |               5 |           7 |            8 |            31 |         31 |              15 |
| Pleuronectidae  | *Limanda limanda*              | Common dab               |          7 |          8 |              7 |               3 |          17 |           17 |            46 |         46 |              79 |
| Pleuronectidae  | *Microstomus kitt*             | Lemon sole               |          5 |          4 |              5 |               2 |           5 |            5 |            38 |         38 |              13 |
| Pleuronectidae  | *Platichthys flesus*           | European flounder        |          6 |          8 |              6 |               2 |          21 |           21 |           109 |        109 |             102 |
| Pleuronectidae  | *Pleuronectes platessa*        | European plaice          |          6 |          8 |              6 |               3 |          19 |           18 |           107 |        107 |             109 |
| Scophthalmidae  | *Lepidorhombus whiffiagonis*   | Megrim                   |          7 |          5 |              7 |               3 |           9 |            9 |            34 |         34 |              11 |
| Scophthalmidae  | *Phrynorhombus norvegicus*     | Norwegian topknot        |          3 |          1 |              3 |               0 |           4 |            4 |            10 |         10 |               5 |
| Scophthalmidae  | *Scophthalmus maximus*         | Turbot                   |          3 |          6 |              3 |               2 |          18 |           18 |           111 |        113 |              82 |
| Scophthalmidae  | *Scophthalmus rhombus*         | Brill                    |          5 |          5 |              5 |               2 |          14 |           14 |            30 |         30 |              18 |
| Scophthalmidae  | *Zeugopterus punctatus*        | Topknot                  |          3 |          3 |              3 |               3 |           5 |            5 |             8 |          8 |               6 |
| Scophthalmidae  | *Zeugopterus regius*           | Eckstr<f6>m’s topknot    |          3 |          0 |              3 |               0 |           0 |            0 |             0 |          0 |               0 |
| Soleidae        | *Buglossidium luteum*          | Solenette                |          5 |          2 |              5 |               0 |           8 |            8 |            37 |         37 |               8 |
| Soleidae        | *Microchirus variegatus*       | Thickback sole           |          5 |          4 |              5 |               2 |           6 |            6 |            36 |         36 |              12 |
| Soleidae        | *Pegusa lascaris*              | Sand sole                |          2 |          2 |              2 |               0 |           4 |            4 |             9 |          9 |              59 |
| Soleidae        | *Solea solea*                  | Common sole              |          8 |         12 |              8 |               3 |          25 |           25 |           163 |        163 |             253 |
| Salmonidae      | *Oncorhynchus mykiss*          | Rainbow trout            |         36 |         38 |             36 |              32 |          53 |           48 |           499 |        499 |              89 |
| Salmonidae      | *Salmo salar*                  | Atlantic salmon          |         13 |         31 |             13 |              14 |          25 |           20 |           446 |        448 |              34 |
| Salmonidae      | *Salmo trutta*                 | Sea trout                |         47 |         50 |             47 |              33 |          44 |           43 |           342 |        342 |             434 |
| Salmonidae      | *Thymallus thymallus*          | Grayling                 |         31 |         31 |             31 |              29 |          34 |           34 |           128 |        128 |              37 |
| Agonidae        | *Agonus cataphractus*          | Hooknose                 |          1 |          2 |              1 |               1 |           2 |            2 |            25 |         25 |               2 |
| Cottidae        | *Cottus gobio*                 | Bullhead                 |          4 |          3 |              4 |               2 |           6 |            6 |           114 |        114 |               8 |
| Cottidae        | *Micrenophrys lilljeborgii*    | Norway bullhead          |          1 |          1 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| Cottidae        | *Myoxocephalus scorpius*       | Shorthorn sculpin        |          9 |          6 |              9 |               6 |          13 |           13 |           121 |        121 |             119 |
| Cottidae        | *Taurulus bubalis*             | Longspined bullhead      |          7 |          6 |              7 |               3 |           7 |            7 |             9 |          9 |               4 |
| Cyclopteridae   | *Cyclopterus lumpus*           | Lumpfish                 |          7 |          8 |              7 |               5 |           9 |            9 |            76 |         76 |              10 |
| Liparidae       | *Liparis liparis*              | Striped seasnail         |          4 |          2 |              4 |               0 |           1 |            1 |            16 |         16 |               4 |
| Liparidae       | *Liparis montagui*             | Montagus seasnail        |          2 |          0 |              2 |               0 |           2 |            2 |             1 |          1 |               3 |
| Triglidae       | *Chelidonichthys cuculus*      | Red gurnard              |          6 |          2 |              6 |               2 |           1 |            1 |            54 |         54 |               8 |
| Triglidae       | *Chelidonichthys lastoviza*    | Streaked gurnard         |          3 |          0 |              3 |               0 |           8 |            8 |            35 |         35 |               4 |
| Triglidae       | *Chelidonichthys lucerna*      | Tub gurnard              |          6 |          4 |              6 |               2 |          17 |           16 |            72 |         72 |              11 |
| Triglidae       | *Eutrigla gurnardus*           | Grey gurnard             |          6 |          3 |              6 |               3 |           8 |            8 |            31 |         31 |              10 |
| Siluridae       | *Silurus glanis*               | Wels catfish             |          5 |          5 |              5 |               5 |           9 |            9 |            83 |         83 |               6 |
| Syngnathidae    | *Entelurus aequoreus*          | Snake pipefish           |          4 |          5 |              4 |               3 |           5 |            5 |            10 |         10 |             180 |
| Syngnathidae    | *Hippocampus guttulatus*       | Long-snouted seahorse    |          1 |          0 |              1 |               0 |           8 |            8 |            10 |         10 |               4 |
| Syngnathidae    | *Hippocampus hippocampus*      | Short snouted seahorse   |          8 |          4 |              8 |               4 |          24 |           24 |            44 |         44 |              18 |
| Syngnathidae    | *Nerophis lumbriciformis*      | Worm pipefish            |        125 |        120 |            125 |               0 |         120 |          120 |             3 |          3 |             119 |
| Syngnathidae    | *Nerophis ophidion*            | Straightnose pipefish    |          4 |          5 |              4 |               3 |           4 |            4 |             8 |          8 |               2 |
| Syngnathidae    | *Syngnathus acus*              | Greater pipefish         |          7 |         17 |              7 |               7 |           9 |            9 |            42 |         42 |              18 |
| Syngnathidae    | *Syngnathus rostellatus*       | Nilsson’s pipefish       |          5 |          5 |              5 |               3 |           5 |            5 |            14 |         14 |               3 |
| Syngnathidae    | *Syngnathus typhle*            | Broadnosed pipefish      |          5 |          7 |              5 |               4 |           6 |            6 |            55 |         55 |              38 |
| Balistidae      | *Balistes capriscus*           | Grey triggerfish         |          5 |          6 |              5 |               1 |           5 |            5 |            62 |         62 |               5 |
| Molidae         | *Mola mola*                    | Ocean sunfish            |          9 |          8 |              9 |               5 |          11 |           10 |            23 |         23 |              13 |
| Zeidae          | *Zeus faber*                   | John dory                |         13 |         11 |             13 |               9 |          28 |           26 |           130 |        130 |              22 |
| Petromyzontidae | *Lampetra fluviatilis*         | River lamprey            |          2 |          2 |              2 |               0 |           8 |           10 |            51 |         51 |              45 |
| Petromyzontidae | *Lampetra planeri*             | European brook lamprey   |          3 |          3 |              3 |               0 |          19 |           19 |            79 |         79 |             123 |
| Petromyzontidae | *Petromyzon marinus*           | Sea lamprey              |         18 |          3 |             18 |               0 |           7 |            7 |            58 |         58 |              10 |
| Carcharhinidae  | *Prionace glauca*              | Blue shark               |          9 |          9 |              9 |               9 |          10 |            8 |           884 |        888 |             311 |
| Scyliorhinidae  | *Scyliorhinus canicula*        | Lesser spotted dogfish   |          5 |          2 |              5 |               2 |           6 |            6 |           586 |        586 |              85 |
| Scyliorhinidae  | *Scyliorhinus stellaris*       | Nursehound               |          3 |          2 |              3 |               2 |           3 |            3 |            24 |         24 |               2 |
| Triakidae       | *Galeorhinus galeus*           | Tope shark               |          6 |          3 |              6 |               3 |           5 |            5 |            43 |         48 |               4 |
| Triakidae       | *Mustelus asterias*            | Starry smooth-hound      |          5 |          6 |              5 |               2 |          80 |           80 |           122 |        122 |               4 |
| Alopiidae       | *Alopias vulpinus*             | Thresher                 |         10 |          7 |             10 |               7 |           7 |            7 |            58 |         58 |               6 |
| Cetorhinidae    | *Cetorhinus maximus*           | Basking shark            |         26 |         25 |             26 |              25 |          26 |           26 |            90 |         90 |              26 |
| Lamnidae        | *Lamna nasus*                  | Porbeagle                |          4 |          6 |              4 |               6 |           4 |            4 |           135 |        135 |               4 |
| Dasyatidae      | *Dasyatis pastinaca*           | Common stingray          |          3 |          2 |              3 |               2 |           5 |            5 |            45 |         45 |               2 |
| Rajidae         | *Amblyraja radiata*            | Starry ray               |          5 |          5 |              5 |               4 |           5 |            5 |           213 |        213 |               3 |
| Rajidae         | *Leucoraja naevus*             | Cuckoo ray               |          4 |          4 |              4 |               4 |           5 |            4 |            45 |         45 |               6 |
| Rajidae         | *Raja brachyura*               | Blonde ray               |          6 |          6 |              6 |               6 |           9 |            8 |            64 |         64 |              10 |
| Rajidae         | *Raja clavata*                 | Thornback ray            |          6 |          6 |              6 |               4 |          12 |           11 |           240 |        240 |              16 |
| Rajidae         | *Raja microocellata*           | Small-eyed ray           |          2 |          2 |              2 |               2 |           3 |            2 |            14 |         14 |               1 |
| Rajidae         | *Raja montagui*                | Spotted ray              |          2 |          2 |              2 |               2 |           7 |            4 |            97 |         97 |               1 |
| Rajidae         | *Raja undulata*                | Undulate ray             |          6 |          4 |              6 |               4 |           5 |            4 |            15 |         15 |               3 |
| Squalidae       | *Squalus acanthias*            | Picked dogfish           |          8 |          5 |              8 |               5 |          21 |           19 |           310 |        310 |              16 |

**Table 3. Numbers of new sequences for latest reference library version
compared to previous. Current version is GenBank v258 (10 Dec 2023);
previous version is GenBank v255 (23 May 2023).**

| Scientific Name               | 12S (Miya) | 12S (Riaz) | 12S (Taberlet) | 12S (Valentini) | 16S (Berry) | 16S (Kitano) | COI (Lerayxt) | COI (Ward) | CYTB (Minamoto) |
| :---------------------------- | ---------: | ---------: | -------------: | --------------: | ----------: | -----------: | ------------: | ---------: | --------------: |
| *Acipenser ruthenus*          |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Alepisaurus ferox*           |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Alopias vulpinus*            |          3 |          1 |              3 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Ambloplites rupestris*       |          5 |          1 |              5 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Ameiurus melas*              |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Ameiurus nebulosus*          |          9 |          6 |              9 |               5 |           6 |            6 |             6 |          6 |               6 |
| *Anguilla anguilla*           |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |              34 |
| *Anoplogaster cornuta*        |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Arctozenus risso*            |          2 |          1 |              2 |               1 |           1 |            1 |             2 |          2 |               1 |
| *Argentina silus*             |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Argyropelecus hemigymnus*    |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Argyropelecus olfersii*      |          2 |          1 |              2 |               1 |           1 |            1 |             2 |          2 |               0 |
| *Arnoglossus imperialis*      |          0 |          8 |              0 |               0 |           0 |            0 |             8 |          8 |               0 |
| *Arnoglossus laterna*         |          0 |          3 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Arnoglossus thori*           |          0 |          3 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Auxis rochei*                |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Auxis thazard*               |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Balistes capriscus*          |          2 |          1 |              2 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Barbus barbus*               |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               3 |
| *Bathylagichthys greyae*      |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Belone svetovidovi*          |          0 |          0 |              0 |               0 |           0 |            0 |            10 |         10 |               0 |
| *Benthosema glaciale*         |          1 |          0 |              1 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Blennius ocellaris*          |          1 |          1 |              1 |               1 |           1 |            1 |             2 |          2 |               1 |
| *Bolinichthys supralateralis* |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Brosme brosme*               |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Brotula barbata*             |          2 |          2 |              2 |               2 |           2 |            2 |             2 |          2 |               2 |
| *Callionymus lyra*            |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Callionymus reticulatus*     |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Carassius auratus*           |         42 |         39 |             42 |              40 |          42 |           42 |            69 |         69 |              45 |
| *Carassius carassius*         |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Carcharodon carcharias*      |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Centrophorus granulosus*     |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Centroscymnus crepidater*    |          0 |          0 |              0 |               0 |           1 |            1 |             1 |          1 |               0 |
| *Ceratias holboelli*          |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               1 |
| *Ceratoscopelus maderensis*   |          1 |          0 |              1 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Ceratoscopelus warmingii*    |          1 |          0 |              1 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Cetorhinus maximus*          |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Chauliodus sloani*           |          3 |          0 |              3 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Chelidonichthys cuculus*     |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Chelidonichthys lucerna*     |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Chelon labrosus*             |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Chiasmodon niger*            |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Clupea harengus*             |          6 |          0 |              6 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Cobitis taenia*              |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               3 |
| *Coelorinchus caelorhincus*   |          2 |          2 |              2 |               2 |           2 |            2 |             2 |          2 |               3 |
| *Coelorinchus occa*           |          2 |          2 |              2 |               2 |           2 |            2 |             2 |          2 |               2 |
| *Conger conger*               |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Coptodon zillii*             |          0 |          0 |              0 |               0 |           1 |            0 |            15 |         15 |               0 |
| *Coregonus albula*            |          0 |          0 |              0 |               0 |           2 |            2 |             0 |          0 |               0 |
| *Coregonus lavaretus*         |          0 |          0 |              0 |               0 |          33 |           33 |             0 |          0 |               0 |
| *Coryphaenoides armatus*      |          2 |          2 |              2 |               0 |           2 |            2 |             2 |          2 |               2 |
| *Cyclopterus lumpus*          |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Cyclothone braueri*          |          1 |          5 |              1 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Cyclothone microdon*         |          1 |          0 |              1 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Cyprinus carpio*             |         22 |         20 |             22 |              20 |          27 |           26 |            54 |         54 |              21 |
| *Dactylopterus volitans*      |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Deania calcea*               |          0 |          0 |              0 |               0 |           3 |            3 |             3 |          3 |               0 |
| *Dentex dentex*               |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               1 |
| *Diaphus metopoclampus*       |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Diaphus rafinesquii*         |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Dicentrarchus labrax*        |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Dipturus intermedius*        |          6 |          5 |              6 |               5 |           5 |            5 |            18 |         18 |               5 |
| *Echiichthys vipera*          |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Electrona risso*             |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Enchelyopus cimbrius*        |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Euthynnus alletteratus*      |          2 |          0 |              2 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Eutrigla gurnardus*          |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Gadus morhua*                |          3 |          0 |              3 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Galeorhinus galeus*          |          3 |          3 |              3 |               3 |           3 |            3 |             3 |          3 |               3 |
| *Gasterosteus aculeatus*      |          6 |          0 |              6 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Gephyroberyx darwinii*       |          3 |          3 |              3 |               3 |           3 |            3 |             4 |          4 |               3 |
| *Gobius gasteveni*            |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Gobius niger*                |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Grammicolepis brachiusculus* |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Hexanchus griseus*           |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Howella brodiei*             |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Hyperoplus lanceolatus*      |          1 |          1 |              1 |               1 |           1 |            1 |             0 |          0 |               0 |
| *Ictalurus punctatus*         |          8 |          3 |              8 |               3 |           0 |            0 |             2 |          2 |               0 |
| *Isurus oxyrinchus*           |          2 |          1 |              2 |               1 |           1 |            1 |            58 |         58 |               1 |
| *Kajikia albida*              |          3 |          0 |              3 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Katsuwonus pelamis*          |          1 |          0 |              1 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Labrus mixtus*               |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Lagocephalus lagocephalus*   |          1 |          1 |              1 |               1 |           1 |            1 |             3 |          3 |               1 |
| *Lampadena speculigera*       |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Lampanyctus crocodilus*      |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Lampanyctus macdonaldi*      |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Lampanyctus pusillus*        |          1 |          0 |              1 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Lampris guttatus*            |          1 |          1 |              1 |               1 |           1 |            1 |             2 |          2 |               1 |
| *Lepidocybium flavobrunneum*  |          1 |          1 |              1 |               1 |           1 |            1 |             2 |          2 |               1 |
| *Lepomis gibbosus*            |         17 |          6 |             17 |               6 |           8 |            8 |             8 |          8 |              18 |
| *Lethrinus nebulosus*         |          3 |          3 |              3 |               3 |           0 |            0 |             0 |          0 |               0 |
| *Limanda limanda*             |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Lipophrys pholis*            |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Lophius piscatorius*         |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Lota lota*                   |          0 |          0 |              0 |               0 |           1 |            1 |             1 |          1 |               0 |
| *Luvarus imperialis*          |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Magnisudis atlantica*        |          1 |          1 |              1 |               1 |           1 |            1 |             2 |          2 |               1 |
| *Malacocephalus laevis*       |          2 |          2 |              2 |               2 |           2 |            2 |             2 |          2 |               2 |
| *Malacosteus niger*           |          2 |          1 |              2 |               1 |           1 |            1 |             2 |          2 |               0 |
| *Melanogrammus aeglefinus*    |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Melanonus zugmayeri*         |          2 |          1 |              2 |               1 |           1 |            1 |             2 |          2 |               1 |
| *Merluccius merluccius*       |          0 |          0 |              0 |               0 |           0 |            0 |           108 |        108 |               0 |
| *Microchirus variegatus*      |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Mola mola*                   |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Mugil cephalus*              |          5 |          0 |              5 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Mullus barbatus*             |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Mullus surmuletus*           |          0 |          0 |              0 |               0 |           0 |            0 |             6 |          6 |               0 |
| *Mustelus asterias*           |          1 |          1 |              1 |               1 |           1 |            1 |             2 |          2 |               1 |
| *Myctophum nitidulum*         |          1 |          1 |              1 |               1 |           1 |            1 |             5 |          5 |               1 |
| *Myctophum punctatum*         |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Myliobatis aquila*           |          2 |          0 |              2 |               0 |           2 |            0 |             0 |          0 |               0 |
| *Myoxocephalus scorpius*      |          0 |          0 |              0 |               0 |           7 |            7 |            13 |         13 |               7 |
| *Naucrates ductor*            |          2 |          2 |              2 |               2 |           2 |            2 |             2 |          2 |               2 |
| *Nemichthys scolopaceus*      |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Neoscopelus macrolepidotus*  |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Nessorhamphus ingolfianus*   |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Nezumia sclerorhynchus*      |          1 |          1 |              1 |               0 |           1 |            1 |             1 |          1 |               1 |
| *Notacanthus bonaparte*       |          0 |          0 |              0 |               0 |           0 |            0 |            33 |         33 |               0 |
| *Notolychnus valdiviae*       |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Notoscopelus elongatus*      |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Oncorhynchus mykiss*         |          3 |          1 |              3 |               1 |           1 |            1 |            18 |         18 |               1 |
| *Oreochromis niloticus*       |          1 |          2 |              1 |               1 |           1 |            0 |            93 |         93 |               0 |
| *Osmerus eperlanus*           |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Pagellus acarne*             |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Pagellus erythrinus*         |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Pagrus pagrus*               |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |              14 |
| *Peprilus triacanthus*        |          8 |          1 |              8 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Perca fluviatilis*           |          2 |          2 |              2 |               2 |           2 |            2 |             2 |          2 |               2 |
| *Petromyzon marinus*          |         14 |          0 |             14 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Pimephales promelas*         |          8 |          5 |              8 |               4 |           5 |            5 |             5 |          5 |               7 |
| *Poecilia reticulata*         |          0 |          0 |              0 |               0 |           2 |            2 |             3 |          3 |               0 |
| *Pollachius virens*           |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Pomatoschistus pictus*       |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Prionace glauca*             |          1 |          1 |              1 |               1 |           1 |            1 |             3 |          3 |               1 |
| *Protomyctophum arcticum*     |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Psenes maculatus*            |          2 |          2 |              2 |               2 |           2 |            2 |             2 |          2 |               2 |
| *Pseudorasbora parva*         |          0 |          0 |              0 |               0 |           0 |            0 |            24 |         24 |               1 |
| *Pseudotriakis microdon*      |          0 |          0 |              0 |               0 |           2 |            2 |             2 |          2 |               0 |
| *Pteroplatytrygon violacea*   |          1 |          1 |              1 |               1 |           1 |            1 |             2 |          2 |               1 |
| *Pterycombus brama*           |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Raja brachyura*              |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Raja miraletus*              |          0 |          0 |              0 |               0 |           0 |            0 |           169 |        169 |               0 |
| *Ranzania laevis*             |          2 |          2 |              2 |               2 |           1 |            1 |             1 |          1 |               1 |
| *Regalecus glesne*            |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Rhinochimaera atlantica*     |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Rutilus rutilus*             |          2 |          2 |              2 |               2 |           2 |            2 |             2 |          2 |               2 |
| *Ruvettus pretiosus*          |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Salmo salar*                 |          0 |          0 |              0 |               0 |           0 |            0 |            18 |         18 |               0 |
| *Salmo trutta*                |          3 |          1 |              3 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Sardina pilchardus*          |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Scomber scombrus*            |          5 |          1 |              5 |               1 |           1 |            1 |             7 |          7 |               1 |
| *Scopelogadus beanii*         |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Scopelogadus mizolepis*      |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Scorpaena porcus*            |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Scorpaena scrofa*            |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Seriola dumerili*            |          0 |          0 |              0 |               0 |           0 |            0 |             6 |          6 |               0 |
| *Serrivomer beanii*           |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Solea solea*                 |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Somniosus rostratus*         |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Sparus aurata*               |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Sphoeroides pachygaster*     |          3 |          3 |              3 |               3 |           2 |            2 |             5 |          5 |               2 |
| *Sphyrna zygaena*             |          3 |          1 |              3 |               1 |           1 |            1 |             4 |          4 |               1 |
| *Spondyliosoma cantharus*     |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Sprattus sprattus*           |          1 |          1 |              1 |               1 |           1 |            1 |             4 |          4 |               1 |
| *Squalus acanthias*           |          4 |          0 |              4 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Squatina squatina*           |          0 |          0 |              0 |               0 |           0 |            0 |             9 |          9 |               0 |
| *Sternoptyx diaphana*         |          1 |          1 |              1 |               0 |           1 |            1 |             1 |          1 |               1 |
| *Stomias boa*                 |          3 |          2 |              3 |               2 |           2 |            2 |             3 |          3 |               2 |
| *Symbolophorus veranyi*       |          1 |          0 |              1 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Tetronarce nobiliana*        |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Thunnus alalunga*            |          3 |          0 |              3 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Thunnus albacares*           |          3 |          0 |              3 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Thunnus thynnus*             |          3 |          0 |              3 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Thymallus thymallus*         |          0 |          0 |              0 |               0 |           0 |            0 |             9 |          9 |               0 |
| *Tinca tinca*                 |          1 |          1 |              1 |               1 |           1 |            1 |             2 |          2 |               1 |
| *Torpedo marmorata*           |          0 |          0 |              0 |               0 |           0 |            0 |             7 |          7 |               0 |
| *Trachurus trachurus*         |          0 |          0 |              0 |               0 |           0 |            0 |             9 |          9 |               0 |
| *Trichiurus lepturus*         |         11 |          3 |             11 |               3 |           3 |            3 |           133 |        133 |               3 |
| *Triglops murrayi*            |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Trigonolampa miriceps*       |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Trisopterus luscus*          |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               3 |
| *Trisopterus minutus*         |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Xenodermichthys copei*       |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Xiphias gladius*             |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Zameus squamulosus*          |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Zeus faber*                  |          1 |          1 |              1 |               1 |           1 |            1 |             4 |          4 |               1 |
