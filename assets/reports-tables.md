Reference library coverage report
================
Rupert A. Collins
29 May 2023

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
NCBI GenBank and BOLD databases were searched on 23 May 2023 (GenBank
version 255), and the search retrieved 59955 accessions from 497 unique
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
| 12S   | Miya      |  3375 |       0.82 |          0.97 |        0.74 |       0.16 |         1.9 |             1 |
| 12S   | Riaz      |  3630 |       0.76 |          0.94 |        0.67 |       0.18 |         1.9 |             1 |
| 12S   | Taberlet  |  3375 |       0.82 |          0.97 |        0.74 |       0.16 |         1.9 |             1 |
| 12S   | Valentini |  2411 |       0.64 |          0.79 |        0.56 |       0.21 |         1.4 |             1 |
| 16S   | Berry     |  5430 |       0.80 |          0.98 |        0.71 |       0.14 |         3.4 |             2 |
| 16S   | Kitano    |  5378 |       0.81 |          0.98 |        0.72 |       0.15 |         2.6 |             2 |
| COI   | Lerayxt   | 35122 |       0.92 |          0.98 |        0.89 |       0.02 |        12.4 |             7 |
| COI   | Ward      | 35305 |       0.92 |          0.98 |        0.89 |       0.02 |        21.3 |            11 |
| CYTB  | Minamoto  | 20126 |       0.70 |          0.90 |        0.60 |       0.15 |         8.7 |             2 |

**Table 2. Numbers of sequences represented per species for each primer
set metabarcode fragment. Only common species are shown.**

| Family          | Scientific Name                | Common Name              | 12S (Miya) | 12S (Riaz) | 12S (Taberlet) | 12S (Valentini) | 16S (Berry) | 16S (Kitano) | COI (Lerayxt) | COI (Ward) | CYTB (Minamoto) |
| :-------------- | :----------------------------- | :----------------------- | ---------: | ---------: | -------------: | --------------: | ----------: | -----------: | ------------: | ---------: | --------------: |
| Anguillidae     | *Anguilla anguilla*            | European eel             |         64 |         67 |             64 |              60 |         230 |          248 |           248 |        248 |             148 |
| Congridae       | *Conger conger*                | European conger          |          3 |          0 |              3 |               0 |           2 |            2 |            34 |         34 |               0 |
| Atherinidae     | *Atherina boyeri*              | Big-scale sand smelt     |         11 |        170 |             11 |               2 |          68 |           68 |            40 |         40 |             103 |
| Belonidae       | *Belone belone*                | Garfish                  |          5 |          4 |              5 |               1 |           7 |            7 |            46 |         46 |               9 |
| Clupeidae       | *Alosa alosa*                  | Allis shad               |          2 |          2 |              2 |               2 |           4 |            4 |            32 |         32 |             197 |
| Clupeidae       | *Alosa fallax*                 | Twaite shad              |          3 |          6 |              3 |               6 |          10 |           10 |            18 |         18 |             520 |
| Clupeidae       | *Clupea harengus*              | Atlantic herring         |        107 |        115 |            107 |             109 |         120 |          119 |           191 |        191 |             196 |
| Clupeidae       | *Sardina pilchardus*           | European pilchard        |         11 |          7 |             11 |               4 |          34 |           32 |           236 |        241 |              99 |
| Clupeidae       | *Sprattus sprattus*            | European sprat           |          8 |          6 |              8 |               3 |          15 |           14 |            75 |         75 |              20 |
| Engraulidae     | *Engraulis encrasicolus*       | European anchovy         |          7 |         21 |              7 |               9 |          75 |           68 |           270 |        270 |            1070 |
| Cobitidae       | *Cobitis taenia*               | Spined loach             |          5 |          7 |              5 |               2 |           5 |            5 |            21 |         21 |             189 |
| Cyprinidae      | *Abramis brama*                | Freshwater bream         |         10 |          8 |             10 |               8 |           9 |            9 |           101 |        101 |              28 |
| Cyprinidae      | *Alburnus alburnus*            | Bleak                    |          7 |          6 |              7 |               5 |          12 |           12 |           255 |        256 |              39 |
| Cyprinidae      | *Barbus barbus*                | Barbel                   |          5 |          5 |              5 |               4 |           7 |            7 |           154 |        154 |              81 |
| Cyprinidae      | *Blicca bjoerkna*              | White bream              |          5 |          5 |              5 |               5 |          10 |           10 |            64 |         64 |               8 |
| Cyprinidae      | *Carassius auratus*            | Goldfish                 |         66 |         56 |             66 |              53 |          87 |           86 |           336 |        336 |             832 |
| Cyprinidae      | *Carassius carassius*          | Crucian carp             |          3 |          3 |              3 |               2 |           3 |            4 |            48 |         48 |             128 |
| Cyprinidae      | *Cyprinus carpio*              | Common carp              |         92 |         84 |             92 |              78 |         137 |          138 |           775 |        776 |            1070 |
| Cyprinidae      | *Gobio gobio*                  | Gudgeon                  |          7 |          5 |              7 |               5 |          13 |           13 |           135 |        135 |              46 |
| Cyprinidae      | *Leuciscus idus*               | Ide                      |          3 |          3 |              3 |               2 |           7 |            8 |            63 |         63 |              10 |
| Cyprinidae      | *Leuciscus leuciscus*          | Common dace              |          4 |          1 |              4 |               1 |          47 |           47 |           164 |        164 |             154 |
| Cyprinidae      | *Phoxinus phoxinus*            | Eurasian minnow          |         23 |         20 |             23 |              20 |          23 |           22 |          1331 |       1331 |             891 |
| Cyprinidae      | *Pseudorasbora parva*          | Stone moroko             |         19 |         13 |             19 |              12 |          47 |           44 |           279 |        279 |            1129 |
| Cyprinidae      | *Rutilus rutilus*              | Roach                    |          7 |         10 |              7 |               6 |          18 |           18 |           147 |        147 |             277 |
| Cyprinidae      | *Scardinius erythrophthalmus*  | Rudd                     |          6 |          5 |              6 |               4 |           8 |            8 |           112 |        112 |              28 |
| Cyprinidae      | *Squalius cephalus*            | Chub                     |          8 |          8 |              8 |               7 |          11 |           11 |           313 |        313 |             170 |
| Cyprinidae      | *Tinca tinca*                  | Tench                    |         12 |         11 |             12 |               8 |          13 |           13 |           180 |        180 |              36 |
| Nemacheilidae   | *Barbatula barbatula*          | Stone loach              |         13 |          9 |             13 |               9 |          12 |           12 |           161 |        161 |             345 |
| Esocidae        | *Esox lucius*                  | Northern pike            |         14 |         22 |             14 |              13 |          35 |           35 |           204 |        205 |             332 |
| Gadidae         | *Gadiculus argenteus*          | Silvery pout             |          4 |          4 |              4 |               2 |           7 |            7 |            38 |         38 |              11 |
| Gadidae         | *Gadus morhua*                 | Atlantic cod             |        294 |        300 |            294 |             292 |         306 |          306 |           653 |        654 |            1224 |
| Gadidae         | *Melanogrammus aeglefinus*     | Haddock                  |          9 |          7 |              9 |               7 |          12 |            9 |           246 |        247 |              44 |
| Gadidae         | *Merlangius merlangus*         | Whiting                  |         10 |         12 |             10 |               5 |          21 |           20 |           113 |        114 |              41 |
| Gadidae         | *Micromesistius poutassou*     | Blue whiting             |          8 |          6 |              8 |               4 |           8 |            7 |           111 |        111 |              22 |
| Gadidae         | *Pollachius pollachius*        | Pollack                  |          8 |          6 |              8 |               5 |           3 |            3 |            18 |         18 |              13 |
| Gadidae         | *Pollachius virens*            | Saithe                   |          9 |          9 |              9 |               5 |           7 |            6 |            85 |         85 |              27 |
| Gadidae         | *Raniceps raninus*             | Tadpole fish             |          5 |          2 |              5 |               2 |           5 |            5 |             3 |          3 |               1 |
| Gadidae         | *Trisopterus esmarkii*         | Norway pout              |          3 |          4 |              3 |               2 |           4 |            4 |            36 |         36 |              10 |
| Gadidae         | *Trisopterus luscus*           | Pouting                  |          5 |          6 |              5 |               2 |           5 |            5 |            25 |         25 |              20 |
| Gadidae         | *Trisopterus minutus*          | Poor cod                 |          8 |          8 |              8 |               2 |           9 |            9 |            34 |         34 |              42 |
| Lotidae         | *Ciliata mustela*              | Fivebeard rockling       |          5 |          7 |              5 |               0 |           6 |            6 |            22 |         22 |              92 |
| Lotidae         | *Ciliata septentrionalis*      | Northern rockling        |          3 |          0 |              3 |               0 |           0 |            0 |             0 |          0 |               2 |
| Lotidae         | *Enchelyopus cimbrius*         | Fourbeard rockling       |          4 |          3 |              4 |               0 |           6 |            6 |            42 |         42 |              12 |
| Lotidae         | *Gaidropsarus mediterraneus*   | Shore rockling           |          0 |          7 |              0 |               0 |           6 |            6 |            17 |         17 |              12 |
| Lotidae         | *Gaidropsarus vulgaris*        | Three-bearded rockling   |          0 |          3 |              0 |               0 |           4 |            4 |            25 |         25 |               9 |
| Lotidae         | *Molva molva*                  | Ling                     |          3 |          2 |              3 |               2 |           3 |            3 |            22 |         22 |              21 |
| Merlucciidae    | *Merluccius merluccius*        | European hake            |          5 |         11 |              5 |               3 |          33 |           32 |           343 |        343 |             102 |
| Gasterosteidae  | *Gasterosteus aculeatus*       | Three-spined stickleback |         24 |         23 |             24 |              17 |          26 |           26 |           358 |        358 |             565 |
| Gasterosteidae  | *Pungitius pungitius*          | Ninespine stickleback    |         12 |         30 |             12 |              12 |          49 |           49 |           165 |        165 |             322 |
| Gasterosteidae  | *Spinachia spinachia*          | Sea stickleback          |          5 |          6 |              5 |               4 |           6 |            6 |             7 |          7 |               4 |
| Gobiesocidae    | *Apletodon dentatus*           | Small-headed clingfish   |          1 |          4 |              1 |               0 |           3 |            3 |             1 |          1 |               0 |
| Gobiesocidae    | *Diplecogaster bimaculata*     | Two-spotted clingfish    |          2 |          2 |              2 |               0 |           1 |            1 |             5 |          5 |               0 |
| Gobiesocidae    | *Lepadogaster candolii*        | Connemarra clingfish     |          0 |          6 |              0 |               0 |           4 |            4 |             2 |          2 |               0 |
| Gobiesocidae    | *Lepadogaster purpurea*        | Cornish sucker           |          2 |         12 |              2 |               0 |           1 |            1 |             6 |          6 |               0 |
| Lophiidae       | *Lophius piscatorius*          | Angler                   |          6 |          4 |              6 |               3 |          11 |           12 |            90 |         90 |              24 |
| Mugilidae       | *Chelon auratus*               | Golden grey mullet       |          4 |          8 |              4 |               2 |          19 |           19 |            68 |         68 |              18 |
| Mugilidae       | *Chelon labrosus*              | Thicklip grey mullet     |          8 |         11 |              8 |               5 |          16 |           16 |            32 |         32 |              14 |
| Mugilidae       | *Chelon ramada*                | Thinlip grey mullet      |          7 |         10 |              7 |               1 |          12 |           12 |            57 |         57 |              10 |
| Osmeridae       | *Osmerus eperlanus*            | European smelt           |          4 |          8 |              4 |               4 |          10 |           10 |            36 |         36 |              21 |
| Ammodytidae     | *Ammodytes marinus*            | Lesser sand-eel          |          6 |          9 |              6 |               3 |           2 |            2 |            53 |         53 |               2 |
| Ammodytidae     | *Ammodytes tobianus*           | Small sandeel            |          7 |          4 |              7 |               2 |           2 |            2 |            17 |         17 |               1 |
| Ammodytidae     | *Gymnammodytes semisquamatus*  | Smooth sandeel           |          3 |          2 |              3 |               2 |           2 |            2 |             2 |          2 |               2 |
| Ammodytidae     | *Hyperoplus immaculatus*       | Greater sand-eel         |          3 |          2 |              3 |               2 |           1 |            1 |            11 |         11 |               1 |
| Ammodytidae     | *Hyperoplus lanceolatus*       | Great sandeel            |          5 |          2 |              5 |               1 |           2 |            2 |            39 |         39 |               2 |
| Anarhichadidae  | *Anarhichas lupus*             | Atlantic wolffish        |         90 |         89 |             90 |              89 |          93 |           93 |           196 |        196 |              95 |
| Blenniidae      | *Blennius ocellaris*           | Butterfly blenny         |          4 |          2 |              4 |               0 |           4 |            4 |            24 |         24 |               0 |
| Blenniidae      | *Coryphoblennius galerita*     | Montagu’s blenny         |          3 |         63 |              3 |               1 |          69 |           69 |             8 |          8 |               1 |
| Blenniidae      | *Lipophrys pholis*             | Shanny                   |          6 |         15 |              6 |               1 |          10 |           10 |             8 |          8 |               0 |
| Blenniidae      | *Parablennius gattorugine*     | Tompot blenny            |          1 |          5 |              1 |               0 |           8 |            8 |             4 |          4 |               0 |
| Callionymidae   | *Callionymus lyra*             | Dragonet                 |          3 |          2 |              3 |               0 |           5 |            5 |            35 |         35 |               0 |
| Callionymidae   | *Callionymus maculatus*        |                          |          5 |          0 |              5 |               0 |           1 |            1 |            12 |         12 |               0 |
| Callionymidae   | *Callionymus reticulatus*      | Reticulated dragonet     |          1 |          0 |              1 |               0 |           0 |            0 |            10 |         10 |               0 |
| Caproidae       | *Capros aper*                  | Boarfish                 |          3 |          4 |              3 |               2 |           6 |            6 |            33 |         33 |               2 |
| Carangidae      | *Trachurus trachurus*          | Atlantic horse mackerel  |          8 |          6 |              8 |               5 |          23 |           22 |           175 |        176 |              57 |
| Cepolidae       | *Cepola macrophthalma*         | Red bandfish             |          6 |          0 |              6 |               0 |           1 |            1 |            27 |         27 |               0 |
| Gobiidae        | *Aphia minuta*                 | Transparent goby         |          4 |          5 |              4 |               3 |          15 |           15 |            24 |         24 |              12 |
| Gobiidae        | *Crystallogobius linearis*     | Crystal goby             |          2 |          3 |              2 |               3 |           4 |            4 |            12 |         12 |               1 |
| Gobiidae        | *Gobius cobitis*               | Giant goby               |          2 |          2 |              2 |               2 |           2 |            2 |            11 |         11 |               1 |
| Gobiidae        | *Gobius niger*                 | Black goby               |          6 |          5 |              6 |               3 |          17 |           17 |            81 |         81 |               5 |
| Gobiidae        | *Gobius paganellus*            | Rock goby                |          5 |          2 |              5 |               1 |           7 |            7 |            31 |         31 |               1 |
| Gobiidae        | *Gobiusculus flavescens*       | Two-spotted goby         |          3 |          4 |              3 |               3 |           6 |            6 |            17 |         17 |               5 |
| Gobiidae        | *Lesueurigobius friesii*       | Fries’s goby             |          3 |          3 |              3 |               3 |           6 |            6 |             6 |          6 |               2 |
| Gobiidae        | *Pomatoschistus lozanoi*       | Lozano’s goby            |          0 |          2 |              0 |               0 |           1 |            1 |             8 |          8 |               3 |
| Gobiidae        | *Pomatoschistus microps*       | Common goby              |          9 |          6 |              9 |               2 |           4 |            4 |            17 |         17 |              39 |
| Gobiidae        | *Pomatoschistus minutus*       | Sand goby                |          9 |          8 |              9 |               4 |          10 |           10 |            18 |         18 |             137 |
| Gobiidae        | *Pomatoschistus norvegicus*    | Norway goby              |          0 |          1 |              0 |               0 |           2 |            2 |            11 |         11 |               0 |
| Gobiidae        | *Pomatoschistus pictus*        | Painted goby             |          6 |          2 |              6 |               0 |           2 |            2 |            13 |         13 |               0 |
| Gobiidae        | *Thorogobius ephippiatus*      | Leopard-spotted goby     |          0 |          1 |              0 |               1 |           1 |            1 |             4 |          4 |               1 |
| Labridae        | *Centrolabrus exoletus*        | Rock cook                |          4 |          5 |              4 |               3 |           7 |            7 |             6 |          6 |               3 |
| Labridae        | *Ctenolabrus rupestris*        | Goldsinny-wrasse         |          8 |          6 |              8 |               4 |           6 |            6 |            15 |         15 |               5 |
| Labridae        | *Labrus bergylta*              | Ballan wrasse            |          6 |          5 |              6 |               2 |           6 |            6 |           163 |        165 |               5 |
| Labridae        | *Labrus mixtus*                | Cuckoo wrasse            |          4 |          3 |              4 |               2 |           3 |            3 |            28 |         28 |               2 |
| Labridae        | *Symphodus bailloni*           | Baillon’s wrasse         |          6 |          3 |              6 |               1 |           3 |            3 |             3 |          3 |               0 |
| Labridae        | *Symphodus melops*             | Corkwing wrasse          |          7 |          5 |              7 |               2 |           6 |            6 |             7 |          7 |               1 |
| Moronidae       | *Dicentrarchus labrax*         | European seabass         |          6 |          9 |              6 |               3 |          14 |           13 |            65 |         65 |              27 |
| Mullidae        | *Mullus surmuletus*            | Surmullet                |          6 |          9 |              6 |               2 |          23 |           22 |            99 |         99 |              19 |
| Percidae        | *Gymnocephalus cernua*         | Ruffe                    |          9 |         11 |              9 |               8 |          15 |           15 |           100 |        100 |              12 |
| Percidae        | *Perca fluviatilis*            | European perch           |         22 |         15 |             22 |              10 |          41 |           42 |           189 |        189 |              54 |
| Percidae        | *Sander lucioperca*            | Pike-perch               |          6 |          4 |              6 |               4 |           7 |            8 |           104 |        104 |              38 |
| Pholidae        | *Pholis gunnellus*             | Rock gunnel              |         10 |         10 |             10 |               7 |           7 |            7 |            27 |         27 |               3 |
| Scombridae      | *Scomber scombrus*             | Atlantic mackerel        |          6 |         28 |              6 |               3 |          16 |           15 |           445 |        445 |              78 |
| Sparidae        | *Pagellus bogaraveo*           | Blackspot seabream       |          3 |          3 |              3 |               2 |           3 |            3 |            20 |         28 |              16 |
| Sparidae        | *Pagrus pagrus*                | Red porgy                |          5 |          3 |              5 |               2 |           7 |            7 |           149 |        153 |              15 |
| Sparidae        | *Sparus aurata*                | Gilthead seabream        |          8 |          7 |              8 |               3 |          16 |           15 |           266 |        266 |              70 |
| Sparidae        | *Spondyliosoma cantharus*      | Black seabream           |          3 |          1 |              3 |               0 |           4 |            4 |            52 |         52 |              77 |
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
| Pleuronectidae  | *Platichthys flesus*           | European flounder        |          6 |          8 |              6 |               2 |          21 |           21 |           109 |        109 |             102 |
| Pleuronectidae  | *Pleuronectes platessa*        | European plaice          |          6 |          8 |              6 |               3 |          19 |           18 |           107 |        107 |             109 |
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
| Salmonidae      | *Oncorhynchus mykiss*          | Rainbow trout            |         33 |         37 |             33 |              31 |          52 |           47 |           481 |        481 |              88 |
| Salmonidae      | *Salmo salar*                  | Atlantic salmon          |         13 |         31 |             13 |              14 |          25 |           20 |           428 |        430 |              34 |
| Salmonidae      | *Salmo trutta*                 | Sea trout                |         44 |         49 |             44 |              32 |          43 |           42 |           341 |        341 |             433 |
| Salmonidae      | *Thymallus thymallus*          | Grayling                 |         31 |         31 |             31 |              29 |          34 |           34 |           119 |        119 |              37 |
| Agonidae        | *Agonus cataphractus*          | Hooknose                 |          1 |          2 |              1 |               1 |           2 |            2 |            25 |         25 |               2 |
| Cottidae        | *Cottus gobio*                 | Bullhead                 |          4 |          3 |              4 |               2 |           6 |            6 |           114 |        114 |               8 |
| Cottidae        | *Micrenophrys lilljeborgii*    | Norway bullhead          |          1 |          1 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| Cottidae        | *Myoxocephalus scorpius*       | Shorthorn sculpin        |          9 |          6 |              9 |               6 |           6 |            6 |           108 |        108 |             112 |
| Cottidae        | *Taurulus bubalis*             | Longspined bullhead      |          7 |          6 |              7 |               3 |           7 |            7 |             9 |          9 |               4 |
| Cyclopteridae   | *Cyclopterus lumpus*           | Lumpfish                 |          6 |          7 |              6 |               4 |           8 |            8 |            75 |         75 |               9 |
| Liparidae       | *Liparis liparis*              | Striped seasnail         |          4 |          2 |              4 |               0 |           1 |            1 |            16 |         16 |               4 |
| Liparidae       | *Liparis montagui*             | Montagus seasnail        |          2 |          0 |              2 |               0 |           2 |            2 |             1 |          1 |               3 |
| Triglidae       | *Chelidonichthys cuculus*      | Red gurnard              |          6 |          2 |              6 |               2 |           1 |            1 |            51 |         51 |               8 |
| Triglidae       | *Chelidonichthys lastoviza*    | Streaked gurnard         |          3 |          0 |              3 |               0 |           8 |            8 |            35 |         35 |               4 |
| Triglidae       | *Chelidonichthys lucerna*      | Tub gurnard              |          6 |          4 |              6 |               2 |          17 |           16 |            71 |         71 |              11 |
| Triglidae       | *Eutrigla gurnardus*           | Grey gurnard             |          5 |          2 |              5 |               2 |           7 |            7 |            30 |         30 |               9 |
| Siluridae       | *Silurus glanis*               | Wels catfish             |          5 |          5 |              5 |               5 |           9 |            9 |            83 |         83 |               6 |
| Syngnathidae    | *Entelurus aequoreus*          | Snake pipefish           |          4 |          5 |              4 |               3 |           5 |            5 |            10 |         10 |             180 |
| Syngnathidae    | *Hippocampus guttulatus*       | Long-snouted seahorse    |          1 |          0 |              1 |               0 |           8 |            8 |            10 |         10 |               4 |
| Syngnathidae    | *Hippocampus hippocampus*      | Short snouted seahorse   |          8 |          4 |              8 |               4 |          24 |           24 |            44 |         44 |              18 |
| Syngnathidae    | *Nerophis lumbriciformis*      | Worm pipefish            |        125 |        120 |            125 |               0 |         120 |          120 |             3 |          3 |             119 |
| Syngnathidae    | *Nerophis ophidion*            | Straightnose pipefish    |          4 |          5 |              4 |               3 |           4 |            4 |             8 |          8 |               2 |
| Syngnathidae    | *Syngnathus acus*              | Greater pipefish         |          7 |         17 |              7 |               7 |           9 |            9 |            42 |         42 |              18 |
| Syngnathidae    | *Syngnathus rostellatus*       | Nilsson’s pipefish       |          5 |          5 |              5 |               3 |           5 |            5 |            14 |         14 |               3 |
| Syngnathidae    | *Syngnathus typhle*            | Broadnosed pipefish      |          5 |          7 |              5 |               4 |           6 |            6 |            55 |         55 |              38 |
| Balistidae      | *Balistes capriscus*           | Grey triggerfish         |          3 |          5 |              3 |               0 |           4 |            4 |            61 |         61 |               4 |
| Molidae         | *Mola mola*                    | Ocean sunfish            |          8 |          7 |              8 |               4 |          10 |            9 |            22 |         22 |              12 |
| Zeidae          | *Zeus faber*                   | John dory                |         12 |         10 |             12 |               8 |          27 |           25 |           126 |        126 |              21 |
| Petromyzontidae | *Lampetra fluviatilis*         | River lamprey            |          2 |          2 |              2 |               0 |           8 |           10 |            51 |         51 |              45 |
| Petromyzontidae | *Lampetra planeri*             | European brook lamprey   |          3 |          3 |              3 |               0 |          19 |           19 |            79 |         79 |             123 |
| Petromyzontidae | *Petromyzon marinus*           | Sea lamprey              |          4 |          3 |              4 |               0 |           7 |            7 |            58 |         58 |              10 |
| Carcharhinidae  | *Prionace glauca*              | Blue shark               |          8 |          8 |              8 |               8 |           9 |            7 |           881 |        885 |             310 |
| Scyliorhinidae  | *Scyliorhinus canicula*        | Lesser spotted dogfish   |          5 |          2 |              5 |               2 |           6 |            6 |           586 |        586 |              85 |
| Scyliorhinidae  | *Scyliorhinus stellaris*       | Nursehound               |          3 |          2 |              3 |               2 |           3 |            3 |            24 |         24 |               2 |
| Triakidae       | *Galeorhinus galeus*           | Tope shark               |          3 |          0 |              3 |               0 |           2 |            2 |            40 |         45 |               1 |
| Triakidae       | *Mustelus asterias*            | Starry smooth-hound      |          4 |          5 |              4 |               1 |          79 |           79 |           120 |        120 |               3 |
| Alopiidae       | *Alopias vulpinus*             | Thresher                 |          7 |          6 |              7 |               6 |           6 |            6 |            57 |         57 |               5 |
| Cetorhinidae    | *Cetorhinus maximus*           | Basking shark            |         25 |         24 |             25 |              24 |          25 |           25 |            89 |         89 |              25 |
| Lamnidae        | *Lamna nasus*                  | Porbeagle                |          4 |          6 |              4 |               6 |           4 |            4 |           135 |        135 |               4 |
| Dasyatidae      | *Dasyatis pastinaca*           | Common stingray          |          3 |          2 |              3 |               2 |           5 |            5 |            45 |         45 |               2 |
| Rajidae         | *Amblyraja radiata*            | Starry ray               |          5 |          5 |              5 |               4 |           5 |            5 |           213 |        213 |               3 |
| Rajidae         | *Leucoraja naevus*             | Cuckoo ray               |          4 |          4 |              4 |               4 |           5 |            4 |            45 |         45 |               6 |
| Rajidae         | *Raja brachyura*               | Blonde ray               |          5 |          5 |              5 |               5 |           8 |            7 |            63 |         63 |               9 |
| Rajidae         | *Raja clavata*                 | Thornback ray            |          6 |          6 |              6 |               4 |          12 |           11 |           240 |        240 |              16 |
| Rajidae         | *Raja microocellata*           | Small-eyed ray           |          2 |          2 |              2 |               2 |           3 |            2 |            14 |         14 |               1 |
| Rajidae         | *Raja montagui*                | Spotted ray              |          2 |          2 |              2 |               2 |           7 |            4 |            97 |         97 |               1 |
| Rajidae         | *Raja undulata*                | Undulate ray             |          6 |          4 |              6 |               4 |           5 |            4 |            15 |         15 |               3 |
| Squalidae       | *Squalus acanthias*            | Picked dogfish           |          4 |          5 |              4 |               5 |          21 |           19 |           310 |        310 |              16 |

**Table 3. Numbers of new sequences for latest reference library version
compared to previous. Current version is GenBank v255 (23 May 2023);
previous version is GenBank v253 (07 Jan 2023).**

| Scientific Name                | 12S (Miya) | 12S (Riaz) | 12S (Taberlet) | 12S (Valentini) | 16S (Berry) | 16S (Kitano) | COI (Lerayxt) | COI (Ward) | CYTB (Minamoto) |
| :----------------------------- | ---------: | ---------: | -------------: | --------------: | ----------: | -----------: | ------------: | ---------: | --------------: |
| *Abramis brama*                |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Acipenser ruthenus*           |          0 |          0 |              0 |               0 |           3 |            3 |             3 |          3 |               0 |
| *Agonus cataphractus*          |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Alburnus alburnus*            |          2 |          0 |              2 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Alopias vulpinus*             |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Amblyraja hyperborea*         |          2 |          0 |              2 |               0 |           0 |            0 |            10 |         10 |               0 |
| *Amblyraja radiata*            |          1 |          1 |              1 |               1 |           1 |            1 |            14 |         14 |               1 |
| *Ameiurus melas*               |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               2 |
| *Ameiurus nebulosus*           |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               2 |
| *Ammodytes marinus*            |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Ammodytes tobianus*           |          0 |          0 |              0 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Anarhichas denticulatus*      |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Anguilla anguilla*            |          0 |          0 |              0 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Anoplogaster cornuta*         |          1 |          0 |              1 |               0 |           0 |            0 |            19 |         19 |               0 |
| *Aphia minuta*                 |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Arctozenus risso*             |          0 |          0 |              0 |               0 |           1 |            1 |             2 |          2 |               1 |
| *Artediellus atlanticus*       |          0 |          0 |              0 |               0 |           0 |            0 |             9 |          9 |               0 |
| *Atherina boyeri*              |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Auxis rochei*                 |          1 |          0 |              1 |               0 |           0 |            0 |             7 |          7 |               0 |
| *Auxis thazard*                |          1 |          0 |              1 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Avocettina infans*            |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Balistes capriscus*           |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Barbatula barbatula*          |          3 |          0 |              3 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Barbus barbus*                |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Belone belone*                |          0 |          0 |              0 |               0 |           1 |            1 |             3 |          3 |               0 |
| *Benthosema glaciale*          |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Blicca bjoerkna*              |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Bolinichthys supralateralis*  |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Boops boops*                  |          0 |          0 |              0 |               0 |           1 |            1 |             2 |          2 |               0 |
| *Borostomias antarcticus*      |          1 |          1 |              1 |               1 |           1 |            1 |             3 |          3 |               1 |
| *Callionymus lyra*             |          0 |          0 |              0 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Carassius auratus*            |          4 |          2 |              4 |               2 |           2 |            2 |             3 |          3 |               7 |
| *Carassius carassius*          |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Carcharodon carcharias*       |          2 |          0 |              2 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Careproctus reinhardti*       |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Ceratias holboelli*           |          1 |          0 |              1 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Ceratoscopelus warmingii*     |          0 |          0 |              0 |               0 |           0 |            0 |            33 |         33 |               0 |
| *Chauliodus sloani*            |          1 |          1 |              1 |               0 |           1 |            1 |            99 |         99 |               1 |
| *Chelon labrosus*              |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Chelon ramada*                |          0 |          0 |              0 |               0 |           0 |            0 |             9 |          9 |               0 |
| *Chiasmodon niger*             |          1 |          1 |              1 |               1 |           1 |            1 |            38 |         38 |               1 |
| *Cobitis taenia*               |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Coptodon zillii*              |          1 |          0 |              1 |               0 |           0 |            0 |            18 |         18 |               0 |
| *Coregonus lavaretus*          |          3 |          2 |              3 |               2 |           2 |            2 |             8 |          8 |               2 |
| *Cottunculus microps*          |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Cottus gobio*                 |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Cryptopsaras couesii*         |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Ctenolabrus rupestris*        |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Cyclopterus lumpus*           |          1 |          1 |              1 |               1 |           1 |            1 |             3 |          3 |               1 |
| *Cyprinus carpio*              |          6 |          1 |              6 |               0 |           0 |            0 |             6 |          6 |               0 |
| *Dalatias licha*               |          0 |          0 |              0 |               0 |           0 |            0 |            13 |         13 |               0 |
| *Dasyatis pastinaca*           |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Deania calcea*                |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Dentex dentex*                |          0 |          0 |              0 |               0 |           0 |            0 |            37 |         37 |               0 |
| *Diaphus rafinesquii*          |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Dipturus batis*               |          0 |          0 |              0 |               0 |           0 |            0 |             7 |          7 |               0 |
| *Dipturus nidarosiensis*       |          0 |          0 |              0 |               0 |           0 |            0 |            53 |         53 |               0 |
| *Dipturus oxyrinchus*          |          0 |          0 |              0 |               0 |           0 |            0 |            32 |         32 |               0 |
| *Electrona risso*              |          1 |          0 |              1 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Enchelyopus cimbrius*         |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Esox lucius*                  |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               4 |
| *Etmopterus spinax*            |          0 |          0 |              0 |               0 |           0 |            0 |            20 |         20 |               0 |
| *Gadus morhua*                 |        122 |        122 |            122 |             122 |         122 |          122 |           122 |        122 |             122 |
| *Galeorhinus galeus*           |          2 |          0 |              2 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Gasterosteus aculeatus*       |          3 |          2 |              3 |               2 |           0 |            0 |             4 |          4 |               0 |
| *Gephyroberyx darwinii*        |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Gobio gobio*                  |          2 |          1 |              2 |               1 |           1 |            1 |             5 |          5 |               1 |
| *Gobius niger*                 |          0 |          0 |              0 |               0 |           6 |            6 |            11 |         11 |               0 |
| *Gobius paganellus*            |          0 |          0 |              0 |               0 |           3 |            3 |            14 |         14 |               0 |
| *Gobiusculus flavescens*       |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Gymnocephalus cernua*         |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Halargyreus johnsonii*        |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Halosauropsis macrochir*      |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Hexanchus griseus*            |          2 |          0 |              2 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Hippocampus guttulatus*       |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Hippocampus hippocampus*      |          0 |          0 |              0 |               0 |           0 |            0 |            34 |         34 |               0 |
| *Hirundichthys rondeletii*     |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Hyperoplus immaculatus*       |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Ictalurus punctatus*          |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               2 |
| *Isurus oxyrinchus*            |          2 |          0 |              2 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Kajikia albida*               |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Katsuwonus pelamis*           |          1 |          0 |              1 |               0 |           0 |            1 |             5 |          5 |               0 |
| *Lagocephalus lagocephalus*    |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Lampanyctus macdonaldi*       |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Lampetra planeri*             |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Lampris guttatus*             |          2 |          1 |              2 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Lepidocybium flavobrunneum*   |          1 |          0 |              1 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Lepomis gibbosus*             |          2 |          0 |              2 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Lethrinus nebulosus*          |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Leuciscus idus*               |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Leuciscus leuciscus*          |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Leucoraja circularis*         |          0 |          0 |              0 |               0 |           0 |            0 |             7 |          7 |               0 |
| *Lota lota*                    |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Luvarus imperialis*           |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Lycodes pallidus*             |          0 |          0 |              0 |               0 |           0 |            0 |             7 |          7 |               0 |
| *Magnisudis atlantica*         |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Maulisia mauli*               |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Melamphaes suborbitalis*      |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Melanocetus johnsonii*        |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Melanonus zugmayeri*          |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Misgurnus fossilis*           |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Mobula mobular*               |          2 |          0 |              2 |               0 |           1 |            1 |             2 |          2 |               0 |
| *Mola mola*                    |          2 |          0 |              2 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Mugil cephalus*               |          3 |          1 |              3 |               0 |           2 |            2 |            22 |         22 |               1 |
| *Mustelus asterias*            |          0 |          0 |              0 |               0 |          74 |           74 |            75 |         75 |               0 |
| *Mustelus mustelus*            |          0 |          0 |              0 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Myctophum nitidulum*          |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Myctophum punctatum*          |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Myoxocephalus scorpius*       |          0 |          0 |              0 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Naucrates ductor*             |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Nemichthys scolopaceus*       |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Neogobius melanostomus*       |          0 |          0 |              0 |               0 |           1 |            1 |             9 |          9 |               0 |
| *Nerophis ophidion*            |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Nessorhamphus ingolfianus*    |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Notacanthus chemnitzii*       |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Notolychnus valdiviae*        |          1 |          0 |              1 |               0 |           0 |            0 |            17 |         17 |               0 |
| *Notoscopelus elongatus*       |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Oncorhynchus gorbuscha*       |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Oncorhynchus mykiss*          |          3 |          1 |              3 |               0 |           0 |            0 |             0 |          0 |               1 |
| *Oneirodes eschrichtii*        |          1 |          0 |              1 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Oreochromis niloticus*        |          2 |          0 |              2 |               0 |           0 |            0 |            60 |         60 |               0 |
| *Oxynotus centrina*            |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Oxynotus paradoxus*           |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Pagellus acarne*              |          0 |          0 |              0 |               0 |           1 |            1 |             2 |          2 |               0 |
| *Pagellus erythrinus*          |          0 |          0 |              0 |               0 |           1 |            1 |            16 |         16 |               0 |
| *Pagrus pagrus*                |          2 |          2 |              2 |               2 |           2 |            2 |            81 |         81 |               2 |
| *Perca fluviatilis*            |          1 |          0 |              1 |               0 |           0 |            0 |             7 |          7 |               0 |
| *Phoxinus phoxinus*            |          3 |          2 |              3 |               2 |           1 |            1 |             5 |          5 |               1 |
| *Pimephales promelas*          |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               5 |
| *Platichthys flesus*           |          1 |          1 |              1 |               1 |           1 |            1 |             4 |          4 |               1 |
| *Pleuronectes platessa*        |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Poecilia reticulata*          |          1 |          0 |              1 |               0 |           0 |            0 |            26 |         26 |               0 |
| *Pollachius pollachius*        |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Pomatoschistus pictus*        |          0 |          0 |              0 |               0 |           0 |            0 |             7 |          7 |               0 |
| *Prionace glauca*              |          2 |          0 |              2 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Protomyctophum arcticum*      |          0 |          0 |              0 |               0 |           0 |            0 |            10 |         10 |               0 |
| *Pseudotriakis microdon*       |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Pteroplatytrygon violacea*    |          4 |          0 |              4 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Pungitius pungitius*          |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Raja brachyura*               |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Raja clavata*                 |          0 |          0 |              0 |               0 |           0 |            0 |            88 |         88 |               0 |
| *Raja miraletus*               |          0 |          0 |              0 |               0 |           0 |            0 |            64 |         64 |               0 |
| *Raja montagui*                |          0 |          0 |              0 |               0 |           0 |            0 |            62 |         62 |               0 |
| *Raja undulata*                |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Rajella bathyphila*           |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Rajella fyllae*               |          0 |          0 |              0 |               0 |           0 |            0 |             9 |          9 |               0 |
| *Ranzania laevis*              |          3 |          0 |              3 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Regalecus glesne*             |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Reinhardtius hippoglossoides* |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Remora remora*                |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Rhodeus amarus*               |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Rostroraja alba*              |          0 |          0 |              0 |               0 |           0 |            0 |            13 |         13 |               0 |
| *Rutilus rutilus*              |          1 |          0 |              1 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Ruvettus pretiosus*           |          1 |          0 |              1 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Salmo trutta*                 |          7 |          0 |              7 |               0 |           0 |            0 |             4 |          4 |               1 |
| *Salvelinus alpinus*           |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Salvelinus fontinalis*        |          0 |          0 |              0 |               0 |           0 |            0 |             4 |          4 |               1 |
| *Sander lucioperca*            |          0 |          0 |              0 |               0 |           0 |            0 |             0 |          0 |               8 |
| *Scardinius erythrophthalmus*  |          1 |          0 |              1 |               0 |           0 |            0 |             4 |          4 |               0 |
| *Scomberesox saurus*           |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Scopelogadus mizolepis*       |          0 |          0 |              0 |               0 |           0 |            0 |            11 |         11 |               0 |
| *Scyliorhinus canicula*        |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Silurus glanis*               |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Simenchelys parasitica*       |          0 |          0 |              0 |               0 |           0 |            0 |           127 |        127 |               0 |
| *Somniosus rostratus*          |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Sparus aurata*                |          0 |          0 |              0 |               0 |           1 |            1 |            77 |         77 |               0 |
| *Sphoeroides pachygaster*      |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Sphyrna zygaena*              |          5 |          3 |              5 |               3 |           3 |            3 |             6 |          6 |               3 |
| *Spondyliosoma cantharus*      |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Squalius cephalus*            |          2 |          1 |              2 |               1 |           1 |            1 |             4 |          4 |               3 |
| *Squalus acanthias*            |          0 |          0 |              0 |               0 |           0 |            0 |           166 |        166 |               0 |
| *Sternoptyx diaphana*          |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Symbolophorus veranyi*        |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Symphodus melops*             |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Synaphobranchus kaupii*       |          0 |          0 |              0 |               0 |           0 |            0 |            38 |         38 |               0 |
| *Syngnathus acus*              |          1 |          1 |              1 |               1 |           1 |            1 |             1 |          1 |               1 |
| *Syngnathus typhle*            |          0 |          0 |              0 |               0 |           0 |            0 |             5 |          5 |               0 |
| *Taractes asper*               |          1 |          0 |              1 |               0 |           0 |            0 |             0 |          0 |               0 |
| *Taurulus bubalis*             |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Tetronarce nobiliana*         |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Thunnus alalunga*             |          1 |          0 |              1 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Thunnus albacares*            |          1 |          0 |              1 |               0 |           0 |            0 |             6 |          6 |               0 |
| *Thymallus thymallus*          |          3 |          2 |              3 |               2 |           2 |            2 |             5 |          5 |               2 |
| *Tinca tinca*                  |          3 |          2 |              3 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Torpedo marmorata*            |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Trachurus trachurus*          |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Trichiurus lepturus*          |          1 |          0 |              1 |               0 |           0 |            0 |             2 |          2 |               0 |
| *Trisopterus minutus*          |          0 |          0 |              0 |               0 |           0 |            0 |             3 |          3 |               0 |
| *Xiphias gladius*              |          1 |          0 |              1 |               0 |           0 |            1 |             0 |          0 |               0 |
| *Zameus squamulosus*           |          0 |          0 |              0 |               0 |           0 |            0 |             1 |          1 |               0 |
| *Zeus faber*                   |          0 |          0 |              0 |               0 |           0 |            0 |             2 |          2 |               0 |
