Reference library coverage report
================
Rupert A. Collins
18 November 2025

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
NCBI GenBank and BOLD databases were searched on 12 Nov 2025 (GenBank
version 268), and the search retrieved 69539 accessions from 498 unique
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

| Locus | Fragment | Total | Cov. (all) | Cov. (common) | Cov. (rare) | Singletons | Haps (mean) | Haps (median) |
|:---|:---|---:|---:|---:|---:|---:|---:|---:|
| 12S | Miya | 5424 | 0.83 | 0.97 | 0.76 | 0.12 | 2.2 | 2 |
| 12S | Riaz | 5605 | 0.79 | 0.96 | 0.70 | 0.15 | 2.0 | 1 |
| 12S | Taberlet | 5424 | 0.83 | 0.97 | 0.76 | 0.12 | 2.1 | 2 |
| 12S | Valentini | 4248 | 0.68 | 0.85 | 0.60 | 0.17 | 1.5 | 1 |
| 16S | Berry | 7020 | 0.83 | 0.98 | 0.75 | 0.13 | 3.6 | 2 |
| 16S | Kitano | 6965 | 0.83 | 0.98 | 0.76 | 0.14 | 2.8 | 2 |
| COI | Lerayxt | 42523 | 0.93 | 0.99 | 0.90 | 0.02 | 14.2 | 8 |
| COI | Ward | 42757 | 0.93 | 0.99 | 0.90 | 0.02 | 24.3 | 12 |
| CYTB | Minamoto | 22148 | 0.74 | 0.96 | 0.64 | 0.16 | 8.7 | 2 |

**Table 2. Numbers of sequences represented per species for each primer
set metabarcode fragment. Only common species are shown.**

| Family | Scientific Name | Common Name | 12S (Miya) | 12S (Riaz) | 12S (Taberlet) | 12S (Valentini) | 16S (Berry) | 16S (Kitano) | COI (Lerayxt) | COI (Ward) | CYTB (Minamoto) |
|:---|:---|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Anguillidae | *Anguilla anguilla* | European eel | 85 | 88 | 85 | 81 | 230 | 248 | 281 | 281 | 187 |
| Congridae | *Conger conger* | European conger | 6 | 4 | 6 | 2 | 3 | 3 | 38 | 38 | 1 |
| Atherinidae | *Atherina boyeri* | Big-scale sand smelt | 12 | 171 | 12 | 3 | 69 | 69 | 44 | 44 | 104 |
| Belonidae | *Belone belone* | Garfish | 5 | 15 | 5 | 1 | 9 | 9 | 76 | 76 | 9 |
| Clupeidae | *Alosa alosa* | Allis shad | 2 | 2 | 2 | 2 | 4 | 4 | 32 | 32 | 197 |
| Clupeidae | *Alosa fallax* | Twaite shad | 5 | 8 | 5 | 8 | 11 | 11 | 20 | 20 | 521 |
| Clupeidae | *Clupea harengus* | Atlantic herring | 114 | 116 | 114 | 110 | 121 | 120 | 192 | 192 | 197 |
| Clupeidae | *Sardina pilchardus* | European pilchard | 151 | 147 | 151 | 144 | 192 | 190 | 402 | 407 | 239 |
| Clupeidae | *Sprattus sprattus* | European sprat | 9 | 7 | 9 | 4 | 16 | 15 | 79 | 79 | 21 |
| Engraulidae | *Engraulis encrasicolus* | European anchovy | 7 | 21 | 7 | 9 | 75 | 68 | 282 | 282 | 1070 |
| Cobitidae | *Cobitis taenia* | Spined loach | 5 | 7 | 5 | 2 | 5 | 5 | 42 | 42 | 192 |
| Cyprinidae | *Abramis brama* | Freshwater bream | 22 | 20 | 22 | 20 | 11 | 11 | 104 | 104 | 29 |
| Cyprinidae | *Alburnus alburnus* | Bleak | 20 | 20 | 20 | 19 | 14 | 14 | 264 | 265 | 77 |
| Cyprinidae | *Barbus barbus* | Barbel | 18 | 17 | 18 | 16 | 7 | 7 | 157 | 157 | 84 |
| Cyprinidae | *Blicca bjoerkna* | White bream | 14 | 14 | 14 | 14 | 10 | 10 | 65 | 66 | 8 |
| Cyprinidae | *Carassius auratus* | Goldfish | 120 | 103 | 120 | 99 | 137 | 136 | 429 | 429 | 883 |
| Cyprinidae | *Carassius carassius* | Crucian carp | 4 | 4 | 4 | 3 | 4 | 5 | 214 | 214 | 129 |
| Cyprinidae | *Cyprinus carpio* | Common carp | 129 | 119 | 129 | 113 | 174 | 174 | 889 | 890 | 1229 |
| Cyprinidae | *Gobio gobio* | Gudgeon | 21 | 19 | 21 | 19 | 13 | 13 | 180 | 180 | 46 |
| Cyprinidae | *Leuciscus idus* | Ide | 3 | 3 | 3 | 2 | 7 | 8 | 64 | 66 | 10 |
| Cyprinidae | *Leuciscus leuciscus* | Common dace | 25 | 23 | 25 | 23 | 48 | 48 | 164 | 165 | 155 |
| Cyprinidae | *Phoxinus phoxinus* | Eurasian minnow | 68 | 65 | 68 | 64 | 23 | 22 | 1734 | 1734 | 891 |
| Cyprinidae | *Pseudorasbora parva* | Stone moroko | 30 | 21 | 30 | 20 | 47 | 44 | 503 | 504 | 1132 |
| Cyprinidae | *Rutilus rutilus* | Roach | 35 | 37 | 35 | 33 | 24 | 24 | 245 | 245 | 281 |
| Cyprinidae | *Scardinius erythrophthalmus* | Rudd | 20 | 19 | 20 | 18 | 9 | 9 | 113 | 113 | 29 |
| Cyprinidae | *Squalius cephalus* | Chub | 22 | 22 | 22 | 21 | 12 | 12 | 317 | 317 | 171 |
| Cyprinidae | *Tinca tinca* | Tench | 42 | 41 | 42 | 38 | 15 | 15 | 183 | 183 | 37 |
| Nemacheilidae | *Barbatula barbatula* | Stone loach | 14 | 10 | 14 | 10 | 13 | 13 | 206 | 206 | 358 |
| Esocidae | *Esox lucius* | Northern pike | 34 | 42 | 34 | 33 | 37 | 37 | 208 | 209 | 332 |
| Gadidae | *Gadiculus argenteus* | Silvery pout | 4 | 4 | 4 | 2 | 7 | 7 | 39 | 39 | 11 |
| Gadidae | *Gadus morhua* | Atlantic cod | 297 | 300 | 297 | 292 | 306 | 306 | 709 | 710 | 1224 |
| Gadidae | *Melanogrammus aeglefinus* | Haddock | 13 | 10 | 13 | 10 | 15 | 12 | 289 | 290 | 47 |
| Gadidae | *Merlangius merlangus* | Whiting | 10 | 12 | 10 | 5 | 21 | 20 | 116 | 117 | 41 |
| Gadidae | *Micromesistius poutassou* | Blue whiting | 11 | 9 | 11 | 7 | 10 | 9 | 123 | 123 | 24 |
| Gadidae | *Pollachius pollachius* | Pollack | 8 | 6 | 8 | 5 | 3 | 3 | 18 | 18 | 13 |
| Gadidae | *Pollachius virens* | Saithe | 10 | 9 | 10 | 5 | 7 | 6 | 95 | 95 | 27 |
| Gadidae | *Raniceps raninus* | Tadpole fish | 5 | 2 | 5 | 2 | 5 | 5 | 3 | 3 | 1 |
| Gadidae | *Trisopterus esmarkii* | Norway pout | 3 | 4 | 3 | 2 | 4 | 4 | 36 | 36 | 10 |
| Gadidae | *Trisopterus luscus* | Pouting | 6 | 7 | 6 | 3 | 6 | 6 | 27 | 27 | 24 |
| Gadidae | *Trisopterus minutus* | Poor cod | 9 | 9 | 9 | 3 | 9 | 9 | 36 | 36 | 42 |
| Lotidae | *Ciliata mustela* | Fivebeard rockling | 5 | 7 | 5 | 0 | 6 | 6 | 22 | 22 | 92 |
| Lotidae | *Ciliata septentrionalis* | Northern rockling | 3 | 0 | 3 | 0 | 0 | 0 | 0 | 0 | 2 |
| Lotidae | *Enchelyopus cimbrius* | Fourbeard rockling | 6 | 5 | 6 | 2 | 8 | 8 | 59 | 59 | 14 |
| Lotidae | *Gaidropsarus mediterraneus* | Shore rockling | 0 | 7 | 0 | 0 | 6 | 6 | 17 | 17 | 12 |
| Lotidae | *Gaidropsarus vulgaris* | Three-bearded rockling | 0 | 3 | 0 | 0 | 4 | 4 | 25 | 25 | 9 |
| Lotidae | *Molva molva* | Ling | 3 | 2 | 3 | 2 | 3 | 3 | 22 | 22 | 21 |
| Merlucciidae | *Merluccius merluccius* | European hake | 5 | 11 | 5 | 3 | 53 | 52 | 456 | 456 | 102 |
| Gasterosteidae | *Gasterosteus aculeatus* | Three-spined stickleback | 44 | 37 | 44 | 31 | 28 | 28 | 393 | 393 | 592 |
| Gasterosteidae | *Pungitius pungitius* | Ninespine stickleback | 12 | 30 | 12 | 12 | 49 | 49 | 165 | 165 | 322 |
| Gasterosteidae | *Spinachia spinachia* | Sea stickleback | 5 | 6 | 5 | 4 | 6 | 6 | 7 | 7 | 4 |
| Gobiesocidae | *Apletodon dentatus* | Small-headed clingfish | 1 | 4 | 1 | 0 | 3 | 3 | 2 | 2 | 1 |
| Gobiesocidae | *Diplecogaster bimaculata* | Two-spotted clingfish | 3 | 3 | 3 | 1 | 2 | 2 | 7 | 7 | 1 |
| Gobiesocidae | *Lepadogaster candolii* | Connemarra clingfish | 1 | 7 | 1 | 1 | 5 | 5 | 2 | 2 | 1 |
| Gobiesocidae | *Lepadogaster purpurea* | Cornish sucker | 2 | 12 | 2 | 0 | 1 | 1 | 7 | 7 | 0 |
| Lophiidae | *Lophius piscatorius* | Angler | 6 | 4 | 6 | 3 | 11 | 12 | 91 | 91 | 24 |
| Mugilidae | *Chelon auratus* | Golden grey mullet | 4 | 8 | 4 | 2 | 19 | 19 | 69 | 69 | 18 |
| Mugilidae | *Chelon labrosus* | Thicklip grey mullet | 9 | 12 | 9 | 6 | 17 | 17 | 33 | 33 | 15 |
| Mugilidae | *Chelon ramada* | Thinlip grey mullet | 8 | 11 | 8 | 2 | 13 | 13 | 59 | 59 | 11 |
| Osmeridae | *Osmerus eperlanus* | European smelt | 5 | 9 | 5 | 5 | 11 | 11 | 39 | 39 | 22 |
| Ammodytidae | *Ammodytes marinus* | Lesser sand-eel | 6 | 9 | 6 | 3 | 2 | 2 | 53 | 53 | 2 |
| Ammodytidae | *Ammodytes tobianus* | Small sandeel | 7 | 4 | 7 | 2 | 2 | 2 | 17 | 17 | 1 |
| Ammodytidae | *Gymnammodytes semisquamatus* | Smooth sandeel | 4 | 3 | 4 | 3 | 2 | 2 | 3 | 3 | 2 |
| Ammodytidae | *Hyperoplus immaculatus* | Greater sand-eel | 3 | 2 | 3 | 2 | 1 | 1 | 12 | 12 | 1 |
| Ammodytidae | *Hyperoplus lanceolatus* | Great sandeel | 6 | 3 | 6 | 2 | 3 | 3 | 39 | 39 | 2 |
| Anarhichadidae | *Anarhichas lupus* | Atlantic wolffish | 90 | 89 | 90 | 89 | 93 | 93 | 196 | 196 | 95 |
| Blenniidae | *Blennius ocellaris* | Butterfly blenny | 5 | 3 | 5 | 1 | 5 | 5 | 26 | 26 | 1 |
| Blenniidae | *Coryphoblennius galerita* | Montagu’s blenny | 3 | 63 | 3 | 1 | 69 | 69 | 8 | 8 | 1 |
| Blenniidae | *Lipophrys pholis* | Shanny | 7 | 16 | 7 | 2 | 11 | 11 | 9 | 9 | 1 |
| Blenniidae | *Parablennius gattorugine* | Tompot blenny | 2 | 6 | 2 | 1 | 9 | 9 | 5 | 5 | 1 |
| Callionymidae | *Callionymus lyra* | Dragonet | 3 | 2 | 3 | 0 | 5 | 5 | 37 | 37 | 0 |
| Callionymidae | *Callionymus maculatus* |  | 5 | 0 | 5 | 0 | 1 | 1 | 14 | 14 | 0 |
| Callionymidae | *Callionymus reticulatus* | Reticulated dragonet | 1 | 0 | 1 | 0 | 0 | 0 | 11 | 11 | 0 |
| Caproidae | *Capros aper* | Boarfish | 3 | 4 | 3 | 2 | 6 | 6 | 35 | 35 | 2 |
| Carangidae | *Trachurus trachurus* | Atlantic horse mackerel | 10 | 8 | 10 | 7 | 24 | 23 | 192 | 193 | 58 |
| Cepolidae | *Cepola macrophthalma* | Red bandfish | 6 | 0 | 6 | 0 | 1 | 1 | 29 | 29 | 0 |
| Gobiidae | *Aphia minuta* | Transparent goby | 4 | 5 | 4 | 3 | 15 | 15 | 25 | 25 | 13 |
| Gobiidae | *Crystallogobius linearis* | Crystal goby | 2 | 3 | 2 | 3 | 4 | 4 | 13 | 13 | 1 |
| Gobiidae | *Gobius cobitis* | Giant goby | 2 | 3 | 2 | 2 | 3 | 3 | 11 | 11 | 2 |
| Gobiidae | *Gobius niger* | Black goby | 7 | 10 | 7 | 4 | 21 | 22 | 88 | 88 | 7 |
| Gobiidae | *Gobius paganellus* | Rock goby | 5 | 4 | 5 | 1 | 9 | 9 | 31 | 31 | 2 |
| Gobiidae | *Gobiusculus flavescens* | Two-spotted goby | 3 | 4 | 3 | 3 | 6 | 6 | 17 | 17 | 5 |
| Gobiidae | *Lesueurigobius friesii* | Fries’s goby | 3 | 3 | 3 | 3 | 6 | 6 | 8 | 8 | 3 |
| Gobiidae | *Pomatoschistus lozanoi* | Lozano’s goby | 0 | 2 | 0 | 0 | 1 | 1 | 8 | 8 | 3 |
| Gobiidae | *Pomatoschistus microps* | Common goby | 9 | 6 | 9 | 2 | 4 | 4 | 17 | 17 | 39 |
| Gobiidae | *Pomatoschistus minutus* | Sand goby | 9 | 8 | 9 | 4 | 10 | 10 | 20 | 20 | 137 |
| Gobiidae | *Pomatoschistus norvegicus* | Norway goby | 0 | 1 | 0 | 0 | 2 | 2 | 11 | 11 | 0 |
| Gobiidae | *Pomatoschistus pictus* | Painted goby | 6 | 2 | 6 | 0 | 2 | 2 | 18 | 18 | 1 |
| Gobiidae | *Thorogobius ephippiatus* | Leopard-spotted goby | 0 | 1 | 0 | 1 | 1 | 1 | 5 | 5 | 1 |
| Labridae | *Centrolabrus exoletus* | Rock cook | 4 | 5 | 4 | 3 | 7 | 7 | 6 | 6 | 3 |
| Labridae | *Ctenolabrus rupestris* | Goldsinny-wrasse | 9 | 7 | 9 | 5 | 7 | 7 | 16 | 16 | 6 |
| Labridae | *Labrus bergylta* | Ballan wrasse | 7 | 6 | 7 | 3 | 7 | 7 | 164 | 166 | 6 |
| Labridae | *Labrus mixtus* | Cuckoo wrasse | 5 | 4 | 5 | 3 | 4 | 4 | 29 | 29 | 3 |
| Labridae | *Symphodus bailloni* | Baillon’s wrasse | 7 | 4 | 7 | 2 | 4 | 4 | 4 | 4 | 1 |
| Labridae | *Symphodus melops* | Corkwing wrasse | 7 | 5 | 7 | 2 | 6 | 6 | 7 | 7 | 1 |
| Moronidae | *Dicentrarchus labrax* | European seabass | 6 | 9 | 6 | 3 | 14 | 13 | 71 | 71 | 27 |
| Mullidae | *Mullus surmuletus* | Surmullet | 8 | 11 | 8 | 4 | 24 | 23 | 107 | 107 | 20 |
| Percidae | *Gymnocephalus cernua* | Ruffe | 30 | 32 | 30 | 29 | 15 | 15 | 111 | 111 | 12 |
| Percidae | *Perca fluviatilis* | European perch | 56 | 49 | 56 | 44 | 44 | 45 | 207 | 207 | 57 |
| Percidae | *Sander lucioperca* | Pike-perch | 15 | 13 | 15 | 13 | 9 | 10 | 110 | 110 | 38 |
| Pholidae | *Pholis gunnellus* | Rock gunnel | 10 | 10 | 10 | 7 | 7 | 7 | 29 | 29 | 3 |
| Scombridae | *Scomber scombrus* | Atlantic mackerel | 12 | 30 | 12 | 5 | 17 | 16 | 481 | 481 | 79 |
| Sparidae | *Pagellus bogaraveo* | Blackspot seabream | 3 | 3 | 3 | 2 | 3 | 3 | 20 | 28 | 16 |
| Sparidae | *Pagrus pagrus* | Red porgy | 8 | 6 | 8 | 9 | 10 | 10 | 167 | 171 | 32 |
| Sparidae | *Sparus aurata* | Gilthead seabream | 8 | 7 | 8 | 3 | 17 | 16 | 271 | 271 | 70 |
| Sparidae | *Spondyliosoma cantharus* | Black seabream | 6 | 4 | 6 | 3 | 4 | 4 | 57 | 57 | 77 |
| Stichaeidae | *Chirolophis ascanii* | Yarrell’s blenny | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 |
| Stichaeidae | *Lumpenus lampretaeformis* | Snakeblenny | 3 | 2 | 3 | 2 | 2 | 2 | 34 | 34 | 65 |
| Trachinidae | *Echiichthys vipera* | Lesser weever | 6 | 5 | 6 | 3 | 4 | 4 | 22 | 22 | 5 |
| Trachinidae | *Trachinus draco* | Greater weever | 4 | 3 | 4 | 1 | 7 | 7 | 39 | 39 | 7 |
| Zoarcidae | *Zoarces viviparus* | Eelpout | 4 | 4 | 4 | 2 | 7 | 7 | 9 | 9 | 84 |
| Bothidae | *Arnoglossus laterna* | Mediterranean scaldfish | 6 | 7 | 6 | 0 | 11 | 11 | 66 | 66 | 1 |
| Pleuronectidae | *Glyptocephalus cynoglossus* | Witch flounder | 4 | 3 | 4 | 3 | 4 | 4 | 65 | 65 | 17 |
| Pleuronectidae | *Hippoglossoides platessoides* | American plaice | 6 | 4 | 6 | 2 | 7 | 6 | 74 | 74 | 16 |
| Pleuronectidae | *Hippoglossus hippoglossus* | Atlantic halibut | 11 | 11 | 11 | 10 | 12 | 13 | 39 | 39 | 20 |
| Pleuronectidae | *Limanda limanda* | Common dab | 7 | 8 | 7 | 3 | 17 | 17 | 46 | 46 | 79 |
| Pleuronectidae | *Microstomus kitt* | Lemon sole | 6 | 5 | 6 | 3 | 6 | 6 | 40 | 40 | 14 |
| Pleuronectidae | *Platichthys flesus* | European flounder | 7 | 9 | 7 | 3 | 22 | 22 | 115 | 115 | 103 |
| Pleuronectidae | *Pleuronectes platessa* | European plaice | 6 | 8 | 6 | 4 | 19 | 18 | 107 | 107 | 109 |
| Scophthalmidae | *Lepidorhombus whiffiagonis* | Megrim | 8 | 6 | 8 | 4 | 9 | 9 | 34 | 34 | 11 |
| Scophthalmidae | *Phrynorhombus norvegicus* | Norwegian topknot | 3 | 1 | 3 | 0 | 4 | 4 | 10 | 10 | 5 |
| Scophthalmidae | *Scophthalmus maximus* | Turbot | 4 | 7 | 4 | 3 | 19 | 19 | 113 | 115 | 83 |
| Scophthalmidae | *Scophthalmus rhombus* | Brill | 5 | 5 | 5 | 2 | 14 | 14 | 31 | 31 | 18 |
| Scophthalmidae | *Zeugopterus punctatus* | Topknot | 3 | 3 | 3 | 3 | 5 | 5 | 8 | 8 | 6 |
| Scophthalmidae | *Zeugopterus regius* | Eckstr<f6>m’s topknot | 4 | 1 | 4 | 1 | 1 | 1 | 1 | 1 | 1 |
| Soleidae | *Buglossidium luteum* | Solenette | 5 | 2 | 5 | 0 | 8 | 8 | 37 | 37 | 8 |
| Soleidae | *Microchirus variegatus* | Thickback sole | 5 | 4 | 5 | 2 | 6 | 6 | 37 | 37 | 12 |
| Soleidae | *Pegusa lascaris* | Sand sole | 2 | 2 | 2 | 0 | 4 | 4 | 9 | 9 | 59 |
| Soleidae | *Solea solea* | Common sole | 8 | 12 | 8 | 3 | 25 | 25 | 180 | 180 | 253 |
| Salmonidae | *Oncorhynchus mykiss* | Rainbow trout | 65 | 65 | 65 | 59 | 73 | 68 | 608 | 609 | 107 |
| Salmonidae | *Salmo salar* | Atlantic salmon | 30 | 48 | 30 | 31 | 40 | 35 | 674 | 676 | 60 |
| Salmonidae | *Salmo trutta* | Sea trout | 78 | 81 | 78 | 64 | 45 | 44 | 461 | 461 | 595 |
| Salmonidae | *Thymallus thymallus* | Grayling | 53 | 53 | 53 | 51 | 44 | 44 | 143 | 143 | 47 |
| Agonidae | *Agonus cataphractus* | Hooknose | 2 | 3 | 2 | 2 | 3 | 3 | 26 | 26 | 3 |
| Cottidae | *Cottus gobio* | Bullhead | 4 | 3 | 4 | 2 | 6 | 6 | 134 | 134 | 8 |
| Cottidae | *Micrenophrys lilljeborgii* | Norway bullhead | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 |
| Cottidae | *Myoxocephalus scorpius* | Shorthorn sculpin | 9 | 6 | 9 | 6 | 13 | 13 | 121 | 121 | 119 |
| Cottidae | *Taurulus bubalis* | Longspined bullhead | 7 | 6 | 7 | 3 | 7 | 7 | 9 | 9 | 4 |
| Cyclopteridae | *Cyclopterus lumpus* | Lumpfish | 7 | 8 | 7 | 5 | 9 | 9 | 82 | 82 | 10 |
| Liparidae | *Liparis liparis* | Striped seasnail | 4 | 2 | 4 | 0 | 1 | 1 | 16 | 16 | 4 |
| Liparidae | *Liparis montagui* | Montagus seasnail | 2 | 0 | 2 | 0 | 2 | 2 | 1 | 1 | 3 |
| Triglidae | *Chelidonichthys cuculus* | Red gurnard | 8 | 4 | 8 | 4 | 12 | 12 | 55 | 55 | 9 |
| Triglidae | *Chelidonichthys lastoviza* | Streaked gurnard | 3 | 0 | 3 | 0 | 18 | 18 | 37 | 37 | 4 |
| Triglidae | *Chelidonichthys lucerna* | Tub gurnard | 7 | 5 | 7 | 3 | 28 | 27 | 74 | 74 | 12 |
| Triglidae | *Eutrigla gurnardus* | Grey gurnard | 6 | 3 | 6 | 3 | 18 | 18 | 31 | 31 | 10 |
| Siluridae | *Silurus glanis* | Wels catfish | 24 | 24 | 24 | 24 | 16 | 16 | 95 | 95 | 13 |
| Syngnathidae | *Entelurus aequoreus* | Snake pipefish | 4 | 5 | 4 | 3 | 8 | 8 | 10 | 10 | 187 |
| Syngnathidae | *Hippocampus guttulatus* | Long-snouted seahorse | 1 | 0 | 1 | 0 | 8 | 8 | 17 | 17 | 4 |
| Syngnathidae | *Hippocampus hippocampus* | Short snouted seahorse | 8 | 4 | 8 | 4 | 24 | 24 | 48 | 48 | 18 |
| Syngnathidae | *Nerophis lumbriciformis* | Worm pipefish | 125 | 120 | 125 | 0 | 124 | 124 | 3 | 3 | 119 |
| Syngnathidae | *Nerophis ophidion* | Straightnose pipefish | 4 | 5 | 4 | 3 | 10 | 10 | 8 | 8 | 2 |
| Syngnathidae | *Syngnathus acus* | Greater pipefish | 7 | 17 | 7 | 7 | 9 | 9 | 42 | 42 | 49 |
| Syngnathidae | *Syngnathus rostellatus* | Nilsson’s pipefish | 5 | 5 | 5 | 3 | 5 | 5 | 14 | 14 | 3 |
| Syngnathidae | *Syngnathus typhle* | Broadnosed pipefish | 5 | 7 | 5 | 4 | 6 | 6 | 55 | 55 | 77 |
| Balistidae | *Balistes capriscus* | Grey triggerfish | 5 | 6 | 5 | 1 | 5 | 5 | 66 | 66 | 5 |
| Molidae | *Mola mola* | Ocean sunfish | 10 | 8 | 10 | 5 | 11 | 10 | 26 | 26 | 13 |
| Zeidae | *Zeus faber* | John dory | 13 | 11 | 13 | 9 | 29 | 27 | 235 | 235 | 22 |
| Petromyzontidae | *Lampetra fluviatilis* | River lamprey | 4 | 4 | 4 | 0 | 10 | 12 | 59 | 59 | 47 |
| Petromyzontidae | *Lampetra planeri* | European brook lamprey | 9 | 9 | 9 | 0 | 21 | 21 | 84 | 84 | 125 |
| Petromyzontidae | *Petromyzon marinus* | Sea lamprey | 19 | 4 | 19 | 0 | 7 | 7 | 59 | 59 | 10 |
| Carcharhinidae | *Prionace glauca* | Blue shark | 11 | 11 | 11 | 15 | 11 | 9 | 904 | 908 | 312 |
| Scyliorhinidae | *Scyliorhinus canicula* | Lesser spotted dogfish | 6 | 3 | 6 | 3 | 6 | 6 | 588 | 588 | 85 |
| Scyliorhinidae | *Scyliorhinus stellaris* | Nursehound | 3 | 2 | 3 | 2 | 3 | 3 | 26 | 26 | 2 |
| Triakidae | *Galeorhinus galeus* | Tope shark | 6 | 3 | 6 | 4 | 5 | 5 | 40 | 84 | 4 |
| Triakidae | *Mustelus asterias* | Starry smooth-hound | 6 | 7 | 6 | 3 | 81 | 81 | 127 | 127 | 5 |
| Alopiidae | *Alopias vulpinus* | Thresher | 10 | 7 | 10 | 8 | 7 | 7 | 57 | 57 | 6 |
| Cetorhinidae | *Cetorhinus maximus* | Basking shark | 27 | 26 | 27 | 26 | 27 | 27 | 91 | 91 | 27 |
| Lamnidae | *Lamna nasus* | Porbeagle | 5 | 7 | 5 | 7 | 5 | 5 | 158 | 163 | 5 |
| Dasyatidae | *Dasyatis pastinaca* | Common stingray | 3 | 2 | 3 | 2 | 5 | 5 | 44 | 44 | 2 |
| Rajidae | *Amblyraja radiata* | Starry ray | 531 | 531 | 531 | 530 | 531 | 531 | 758 | 758 | 529 |
| Rajidae | *Leucoraja naevus* | Cuckoo ray | 5 | 5 | 5 | 5 | 6 | 5 | 70 | 70 | 7 |
| Rajidae | *Raja brachyura* | Blonde ray | 6 | 6 | 6 | 6 | 9 | 8 | 64 | 64 | 10 |
| Rajidae | *Raja clavata* | Thornback ray | 6 | 6 | 6 | 4 | 12 | 11 | 241 | 241 | 16 |
| Rajidae | *Raja microocellata* | Small-eyed ray | 2 | 2 | 2 | 2 | 3 | 2 | 14 | 14 | 1 |
| Rajidae | *Raja montagui* | Spotted ray | 2 | 2 | 2 | 2 | 7 | 4 | 98 | 98 | 1 |
| Rajidae | *Raja undulata* | Undulate ray | 6 | 4 | 6 | 4 | 5 | 4 | 15 | 15 | 3 |
| Squalidae | *Squalus acanthias* | Picked dogfish | 9 | 6 | 9 | 6 | 22 | 20 | 329 | 329 | 17 |

**Table 3. Numbers of new sequences for latest reference library version
compared to previous. Current version is GenBank v268 (12 Nov 2025);
previous version is GenBank v258 (10 Dec 2023).**

| Scientific Name | 12S (Miya) | 12S (Riaz) | 12S (Taberlet) | 12S (Valentini) | 16S (Berry) | 16S (Kitano) | COI (Lerayxt) | COI (Ward) | CYTB (Minamoto) |
|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| *Abramis brama* | 12 | 12 | 12 | 12 | 2 | 2 | 3 | 3 | 1 |
| *Acantholabrus palloni* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Acipenser ruthenus* | 1 | 0 | 1 | 0 | 0 | 0 | 6 | 6 | 0 |
| *Acipenser sturio* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Agonus cataphractus* | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| *Alburnus alburnus* | 14 | 14 | 14 | 14 | 2 | 2 | 9 | 9 | 38 |
| *Alopias vulpinus* | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 1 | 0 |
| *Alosa fallax* | 2 | 2 | 2 | 2 | 1 | 1 | 2 | 2 | 1 |
| *Ambloplites rupestris* | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
| *Amblyraja hyperborea* | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 4 | 0 |
| *Amblyraja jenseni* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Amblyraja radiata* | 526 | 526 | 526 | 526 | 526 | 526 | 545 | 545 | 526 |
| *Ameiurus melas* | 5 | 5 | 5 | 5 | 0 | 0 | 5 | 5 | 9 |
| *Ameiurus nebulosus* | 7 | 7 | 7 | 7 | 10 | 10 | 106 | 106 | 46 |
| *Anarhichas denticulatus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Anguilla anguilla* | 21 | 21 | 21 | 21 | 0 | 0 | 37 | 37 | 5 |
| *Anoplogaster cornuta* | 0 | 0 | 0 | 0 | 1 | 1 | 19 | 19 | 0 |
| *Antimora rostrata* | 0 | 0 | 0 | 0 | 1 | 1 | 5 | 5 | 0 |
| *Aphia minuta* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 1 |
| *Apletodon dentatus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 1 |
| *Apristurus laurussonii* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Arctozenus risso* | 0 | 0 | 0 | 0 | 0 | 0 | 22 | 22 | 0 |
| *Argyropelecus hemigymnus* | 1 | 0 | 1 | 0 | 0 | 0 | 18 | 18 | 0 |
| *Argyropelecus olfersii* | 0 | 0 | 0 | 0 | 0 | 0 | 9 | 9 | 0 |
| *Argyrosomus regius* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Arnoglossus laterna* | 0 | 0 | 0 | 0 | 1 | 1 | 3 | 3 | 0 |
| *Artediellus atlanticus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Atherina boyeri* | 1 | 1 | 1 | 1 | 1 | 1 | 4 | 4 | 1 |
| *Auxis rochei* | 1 | 1 | 1 | 1 | 1 | 1 | 134 | 134 | 1 |
| *Auxis thazard* | 2 | 1 | 2 | 1 | 2 | 2 | 40 | 40 | 7 |
| *Bajacalifornia megalops* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Balistes capriscus* | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 4 | 0 |
| *Barbantus curvifrons* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Barbatula barbatula* | 1 | 1 | 1 | 1 | 1 | 1 | 47 | 47 | 13 |
| *Barbus barbus* | 13 | 12 | 13 | 12 | 0 | 0 | 3 | 3 | 0 |
| *Bathypterois dubius* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Bathyraja spinicauda* | 1 | 1 | 1 | 1 | 1 | 1 | 2 | 2 | 1 |
| *Bathysaurus ferox* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Bathysolea profundicola* | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 |
| *Belone belone* | 0 | 11 | 0 | 0 | 2 | 2 | 31 | 31 | 0 |
| *Belone svetovidovi* | 0 | 70 | 0 | 0 | 0 | 0 | 328 | 328 | 0 |
| *Benthosema glaciale* | 0 | 0 | 0 | 0 | 0 | 0 | 14 | 14 | 0 |
| *Beryx decadactylus* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Blicca bjoerkna* | 9 | 9 | 9 | 9 | 0 | 0 | 1 | 2 | 0 |
| *Bolinichthys supralateralis* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Boops boops* | 1 | 1 | 1 | 1 | 16 | 16 | 17 | 17 | 1 |
| *Borostomias antarcticus* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Brama brama* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Brosme brosme* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Brotula barbata* | 1 | 1 | 1 | 1 | 1 | 1 | 6 | 6 | 1 |
| *Callionymus maculatus* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Capros aper* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Carassius auratus* | 12 | 8 | 12 | 6 | 8 | 8 | 25 | 25 | 6 |
| *Carassius carassius* | 0 | 0 | 0 | 0 | 0 | 0 | 165 | 165 | 0 |
| *Carcharodon carcharias* | 296 | 296 | 296 | 296 | 295 | 295 | 307 | 307 | 295 |
| *Careproctus reinhardti* | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| *Centrolophus niger* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Centrophorus granulosus* | 0 | 0 | 0 | 2 | 0 | 0 | 1 | 1 | 0 |
| *Centrophorus squamosus* | 0 | 0 | 0 | 1 | 0 | 0 | 5 | 5 | 0 |
| *Centroscyllium fabricii* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 3 | 0 |
| *Centroscymnus coelolepis* | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 5 | 0 |
| *Centroscymnus crepidater* | 0 | 0 | 0 | 0 | 0 | 0 | 8 | 8 | 0 |
| *Centroscymnus owstonii* | 0 | 0 | 0 | 2 | 0 | 0 | 1 | 1 | 0 |
| *Cepola macrophthalma* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Ceratoscopelus maderensis* | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 4 | 0 |
| *Ceratoscopelus warmingii* | 2 | 1 | 2 | 1 | 0 | 0 | 104 | 104 | 0 |
| *Cetorhinus maximus* | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| *Chaenophryne draco* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Chauliodus sloani* | 1 | 1 | 1 | 0 | 0 | 0 | 17 | 17 | 0 |
| *Chelidonichthys cuculus* | 2 | 2 | 2 | 2 | 11 | 11 | 1 | 1 | 1 |
| *Chelidonichthys lastoviza* | 0 | 0 | 0 | 0 | 10 | 10 | 2 | 2 | 0 |
| *Chelidonichthys lucerna* | 1 | 1 | 1 | 1 | 11 | 11 | 2 | 2 | 1 |
| *Chelon auratus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Chelon ramada* | 1 | 1 | 1 | 1 | 1 | 1 | 4 | 4 | 1 |
| *Chiasmodon niger* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Chimaera monstrosa* | 1 | 1 | 1 | 1 | 0 | 0 | 22 | 22 | 0 |
| *Chlamydoselachus anguineus* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Cichlasoma bimaculatum* | 6 | 6 | 6 | 6 | 0 | 0 | 1 | 1 | 0 |
| *Clupea harengus* | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| *Cobitis taenia* | 0 | 0 | 0 | 0 | 0 | 0 | 21 | 21 | 0 |
| *Coelorinchus caelorhincus* | 2 | 2 | 2 | 2 | 1 | 1 | 5 | 5 | 1 |
| *Coelorinchus occa* | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| *Conger conger* | 2 | 3 | 2 | 1 | 0 | 0 | 3 | 3 | 0 |
| *Coptodon zillii* | 1 | 1 | 1 | 1 | 1 | 1 | 25 | 25 | 1 |
| *Coregonus albula* | 0 | 0 | 0 | 0 | 4 | 4 | 0 | 0 | 0 |
| *Coregonus lavaretus* | 6 | 6 | 6 | 6 | 2 | 2 | 2 | 2 | 1 |
| *Coris julis* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Coryphaenoides armatus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Coryphaenoides brevibarbis* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Cottunculus microps* | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 5 | 0 |
| *Cottus gobio* | 0 | 0 | 0 | 0 | 0 | 0 | 20 | 20 | 0 |
| *Crystallogobius linearis* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Ctenolabrus rupestris* | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| *Cyclopterus lumpus* | 0 | 0 | 0 | 0 | 0 | 0 | 6 | 6 | 0 |
| *Cyclothone braueri* | 0 | 1 | 0 | 0 | 0 | 0 | 16 | 16 | 0 |
| *Cyclothone microdon* | 2 | 0 | 2 | 0 | 0 | 0 | 9 | 9 | 0 |
| *Cyclothone obscura* | 1 | 0 | 1 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Cyprinus carpio* | 15 | 15 | 15 | 15 | 10 | 10 | 66 | 66 | 138 |
| *Dactylopterus volitans* | 1 | 2 | 1 | 1 | 11 | 11 | 7 | 7 | 1 |
| *Dalatias licha* | 0 | 0 | 0 | 0 | 0 | 0 | 7 | 7 | 0 |
| *Deania calcea* | 0 | 0 | 0 | 0 | 0 | 0 | 7 | 7 | 0 |
| *Dentex dentex* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Diaphus dumerilii* | 0 | 0 | 0 | 0 | 0 | 0 | 17 | 17 | 0 |
| *Diaphus metopoclampus* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Diaphus rafinesquii* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Dicentrarchus labrax* | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 4 | 0 |
| *Diplecogaster bimaculata* | 1 | 1 | 1 | 1 | 1 | 1 | 2 | 2 | 1 |
| *Dipturus batis* | 1 | 0 | 1 | 0 | 0 | 0 | 6 | 6 | 0 |
| *Dipturus nidarosiensis* | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 |
| *Dipturus oxyrinchus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Diretmus argenteus* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Echiichthys vipera* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Echinorhinus brucus* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Electrona risso* | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 4 | 0 |
| *Enchelyopus cimbrius* | 1 | 1 | 1 | 1 | 1 | 1 | 16 | 16 | 1 |
| *Engraulis encrasicolus* | 0 | 0 | 0 | 0 | 0 | 0 | 12 | 12 | 0 |
| *Entelurus aequoreus* | 0 | 0 | 0 | 0 | 3 | 3 | 0 | 0 | 7 |
| *Epigonus telescopus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Esox lucius* | 20 | 20 | 20 | 20 | 2 | 2 | 4 | 4 | 0 |
| *Etmopterus princeps* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Etmopterus spinax* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Euthynnus alletteratus* | 1 | 1 | 1 | 1 | 0 | 0 | 6 | 6 | 0 |
| *Eutrigla gurnardus* | 0 | 0 | 0 | 0 | 10 | 10 | 0 | 0 | 0 |
| *Gadiculus argenteus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Gadus morhua* | 0 | 0 | 0 | 0 | 0 | 0 | 55 | 55 | 0 |
| *Galeorhinus galeus* | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 39 | 0 |
| *Galeus melastomus* | 1 | 1 | 1 | 1 | 0 | 0 | 3 | 3 | 0 |
| *Galeus murinus* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Gasterosteus aculeatus* | 14 | 14 | 14 | 14 | 2 | 2 | 35 | 35 | 27 |
| *Gephyroberyx darwinii* | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 4 | 0 |
| *Glyptocephalus cynoglossus* | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 5 | 0 |
| *Gobio gobio* | 14 | 14 | 14 | 14 | 0 | 0 | 45 | 45 | 0 |
| *Gobius cobitis* | 0 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 1 |
| *Gobius cruentatus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 1 |
| *Gobius gasteveni* | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
| *Gobius niger* | 0 | 4 | 0 | 0 | 3 | 4 | 6 | 6 | 1 |
| *Gobius paganellus* | 0 | 2 | 0 | 0 | 2 | 2 | 0 | 0 | 1 |
| *Grammicolepis brachiusculus* | 4 | 4 | 4 | 3 | 4 | 4 | 5 | 5 | 1 |
| *Gymnammodytes semisquamatus* | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 1 | 0 |
| *Gymnocephalus cernua* | 21 | 21 | 21 | 21 | 0 | 0 | 11 | 11 | 0 |
| *Halargyreus johnsonii* | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 0 |
| *Halosauropsis macrochir* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Harriotta raleighana* | 3 | 3 | 3 | 3 | 3 | 3 | 4 | 4 | 3 |
| *Helicolenus dactylopterus* | 3 | 3 | 3 | 3 | 2 | 2 | 11 | 11 | 2 |
| *Heptranchias perlo* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Hexanchus griseus* | 1 | 0 | 1 | 1 | 0 | 0 | 4 | 4 | 0 |
| *Himantolophus groenlandicus* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Hippocampus guttulatus* | 0 | 0 | 0 | 0 | 0 | 0 | 7 | 7 | 0 |
| *Hippocampus hippocampus* | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 4 | 0 |
| *Hippoglossoides platessoides* | 0 | 0 | 0 | 0 | 0 | 0 | 12 | 12 | 0 |
| *Hippoglossus hippoglossus* | 5 | 5 | 5 | 5 | 5 | 5 | 8 | 8 | 5 |
| *Hirundichthys rondeletii* | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 5 | 0 |
| *Histiobranchus bathybius* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Hoplostethus atlanticus* | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 5 | 0 |
| *Hoplostethus mediterraneus* | 2 | 2 | 2 | 2 | 3 | 3 | 5 | 5 | 2 |
| *Howella brodiei* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Hyperoplus immaculatus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Ictalurus punctatus* | 3 | 2 | 3 | 2 | 1 | 1 | 34 | 34 | 1 |
| *Isurus oxyrinchus* | 1 | 1 | 1 | 2 | 1 | 1 | 19 | 20 | 1 |
| *Kajikia albida* | 0 | 0 | 0 | 0 | 0 | 0 | 85 | 85 | 0 |
| *Katsuwonus pelamis* | 4 | 1 | 4 | 1 | 2 | 2 | 45 | 45 | 1 |
| *Labrus bergylta* | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| *Lagocephalus lagocephalus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Lamna nasus* | 1 | 1 | 1 | 1 | 1 | 1 | 23 | 28 | 1 |
| *Lampanyctus macdonaldi* | 0 | 0 | 0 | 0 | 0 | 0 | 6 | 6 | 0 |
| *Lampanyctus pusillus* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Lampetra fluviatilis* | 2 | 2 | 2 | 0 | 2 | 2 | 8 | 8 | 2 |
| *Lampetra planeri* | 6 | 6 | 6 | 0 | 2 | 2 | 5 | 5 | 2 |
| *Lampris guttatus* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Lebetus guilleti* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Lepadogaster candolii* | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| *Lepadogaster purpurea* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Lepidocybium flavobrunneum* | 1 | 0 | 1 | 0 | 0 | 0 | 18 | 18 | 0 |
| *Lepidopus caudatus* | 1 | 1 | 1 | 1 | 2 | 2 | 1 | 1 | 1 |
| *Lepidorhombus whiffiagonis* | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
| *Lepomis gibbosus* | 13 | 13 | 13 | 13 | 2 | 2 | 58 | 58 | 2 |
| *Leptoclinus maculatus* | 0 | 0 | 0 | 0 | 6 | 6 | 9 | 9 | 6 |
| *Lesueurigobius friesii* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 1 |
| *Lethrinus nebulosus* | 4 | 5 | 4 | 1 | 1 | 1 | 47 | 47 | 1 |
| *Leucaspius delineatus* | 2 | 2 | 2 | 2 | 0 | 0 | 12 | 12 | 0 |
| *Leuciscus idus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 3 | 0 |
| *Leuciscus leuciscus* | 22 | 22 | 22 | 22 | 1 | 1 | 1 | 2 | 1 |
| *Leucoraja circularis* | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 4 | 0 |
| *Leucoraja fullonica* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Leucoraja naevus* | 1 | 1 | 1 | 1 | 1 | 1 | 25 | 25 | 1 |
| *Lophius piscatorius* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Lota lota* | 16 | 16 | 16 | 16 | 0 | 0 | 0 | 0 | 1 |
| *Lumpenus lampretaeformis* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Lycodes squamiventer* | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 4 | 0 |
| *Lycodes terraenovae* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Lycodes vahlii* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Lycodonus flagellicauda* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Macroramphosus scolopax* | 6 | 6 | 6 | 6 | 5 | 5 | 15 | 15 | 4 |
| *Magnisudis atlantica* | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 4 | 0 |
| *Malacocephalus laevis* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Malacosteus niger* | 0 | 0 | 0 | 0 | 2 | 2 | 9 | 9 | 0 |
| *Maurolicus muelleri* | 0 | 0 | 0 | 0 | 0 | 0 | 6 | 6 | 0 |
| *Melanocetus johnsonii* | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 4 | 0 |
| *Melanogrammus aeglefinus* | 3 | 3 | 3 | 3 | 3 | 3 | 43 | 43 | 3 |
| *Melanonus zugmayeri* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Merlangius merlangus* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Merluccius merluccius* | 0 | 0 | 0 | 0 | 20 | 20 | 5 | 5 | 0 |
| *Microchirus variegatus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Micromesistius poutassou* | 3 | 3 | 3 | 3 | 2 | 2 | 12 | 12 | 2 |
| *Microstomus kitt* | 1 | 1 | 1 | 1 | 1 | 1 | 2 | 2 | 1 |
| *Mobula mobular* | 0 | 0 | 0 | 0 | 0 | 0 | 151 | 151 | 0 |
| *Mola mola* | 1 | 0 | 1 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Mora moro* | 5 | 5 | 5 | 0 | 0 | 0 | 0 | 0 | 0 |
| *Mugil cephalus* | 6 | 5 | 6 | 3 | 1 | 1 | 102 | 102 | 1 |
| *Mullus barbatus* | 0 | 0 | 0 | 0 | 0 | 0 | 57 | 57 | 45 |
| *Mullus surmuletus* | 2 | 2 | 2 | 2 | 1 | 1 | 2 | 2 | 1 |
| *Mustelus asterias* | 1 | 1 | 1 | 1 | 1 | 1 | 5 | 5 | 1 |
| *Mustelus mustelus* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Myctophum nitidulum* | 1 | 1 | 1 | 1 | 0 | 0 | 4 | 4 | 0 |
| *Myctophum punctatum* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Myxine glutinosa* | 0 | 2 | 0 | 0 | 0 | 2 | 11 | 11 | 2 |
| *Narcetes stomias* | 0 | 0 | 0 | 0 | 2 | 2 | 4 | 4 | 0 |
| *Naucrates ductor* | 0 | 0 | 0 | 0 | 0 | 0 | 7 | 7 | 0 |
| *Nemichthys scolopaceus* | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| *Neogobius melanostomus* | 4 | 3 | 4 | 3 | 0 | 0 | 8 | 8 | 0 |
| *Neoraja caerulea* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Neoscopelus macrolepidotus* | 0 | 0 | 0 | 0 | 2 | 2 | 6 | 6 | 0 |
| *Nerophis lumbriciformis* | 0 | 0 | 0 | 0 | 4 | 4 | 0 | 0 | 0 |
| *Nerophis ophidion* | 0 | 0 | 0 | 0 | 6 | 6 | 0 | 0 | 0 |
| *Nesiarchus nasutus* | 2 | 2 | 2 | 2 | 2 | 2 | 10 | 10 | 2 |
| *Nessorhamphus ingolfianus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Notacanthus bonaparte* | 0 | 0 | 0 | 0 | 0 | 0 | 73 | 73 | 0 |
| *Notacanthus chemnitzii* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Notolychnus valdiviae* | 0 | 0 | 0 | 0 | 0 | 0 | 4 | 4 | 0 |
| *Notoscopelus kroyeri* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Oncorhynchus gorbuscha* | 1 | 1 | 1 | 1 | 1 | 1 | 25 | 25 | 28 |
| *Oncorhynchus mykiss* | 29 | 27 | 29 | 27 | 20 | 20 | 109 | 110 | 18 |
| *Oreochromis niloticus* | 8 | 7 | 8 | 5 | 5 | 5 | 389 | 389 | 0 |
| *Osmerus eperlanus* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Oxynotus paradoxus* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Pagellus acarne* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Pagellus erythrinus* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Pagrus pagrus* | 3 | 3 | 3 | 7 | 3 | 3 | 15 | 15 | 3 |
| *Parablennius gattorugine* | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| *Paralepis coregonoides* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Peprilus triacanthus* | 2 | 2 | 2 | 2 | 2 | 2 | 10 | 10 | 2 |
| *Perca fluviatilis* | 32 | 32 | 32 | 32 | 1 | 1 | 16 | 16 | 1 |
| *Peristedion cataphractum* | 0 | 0 | 0 | 0 | 10 | 10 | 0 | 0 | 0 |
| *Petromyzon marinus* | 1 | 1 | 1 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Pholis gunnellus* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Phoxinus phoxinus* | 45 | 45 | 45 | 44 | 0 | 0 | 403 | 403 | 0 |
| *Phycis blennoides* | 4 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 0 |
| *Pimephales promelas* | 9 | 9 | 9 | 9 | 9 | 9 | 37 | 37 | 9 |
| *Platichthys flesus* | 1 | 1 | 1 | 1 | 1 | 1 | 6 | 6 | 1 |
| *Pleuronectes platessa* | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| *Poecilia reticulata* | 2 | 1 | 2 | 2 | 11 | 11 | 53 | 53 | 1 |
| *Pollachius virens* | 0 | 0 | 0 | 0 | 0 | 0 | 10 | 10 | 0 |
| *Polyacanthonotus rissoanus* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Polyprion americanus* | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 |
| *Pomatoschistus minutus* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Pomatoschistus pictus* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 1 |
| *Prionace glauca* | 2 | 2 | 2 | 6 | 1 | 1 | 20 | 20 | 1 |
| *Protomyctophum arcticum* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Psenes maculatus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Pseudorasbora parva* | 11 | 8 | 11 | 8 | 0 | 0 | 200 | 201 | 2 |
| *Pseudoscopelus altipinnis* | 0 | 0 | 0 | 0 | 0 | 0 | 6 | 6 | 0 |
| *Pseudotriakis microdon* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Pteroplatytrygon violacea* | 1 | 1 | 1 | 1 | 1 | 1 | 2 | 2 | 1 |
| *Pterycombus brama* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Raja clavata* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Raja miraletus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Raja montagui* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Rajella fyllae* | 0 | 0 | 0 | 0 | 0 | 0 | 12 | 12 | 0 |
| *Ranzania laevis* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Regalecus glesne* | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 5 | 0 |
| *Reinhardtius hippoglossoides* | 0 | 0 | 0 | 0 | 0 | 0 | 8 | 8 | 0 |
| *Remora remora* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Rhodeus amarus* | 17 | 17 | 17 | 17 | 0 | 0 | 0 | 0 | 0 |
| *Rhodeus sericeus* | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 |
| *Rostroraja alba* | 1 | 0 | 1 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Rouleina attrita* | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 0 |
| *Rutilus rutilus* | 25 | 25 | 25 | 25 | 4 | 4 | 96 | 96 | 2 |
| *Ruvettus pretiosus* | 2 | 1 | 2 | 0 | 0 | 0 | 17 | 17 | 0 |
| *Salmo salar* | 17 | 17 | 17 | 17 | 15 | 15 | 228 | 228 | 26 |
| *Salmo trutta* | 31 | 31 | 31 | 31 | 1 | 1 | 119 | 119 | 161 |
| *Salvelinus alpinus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Salvelinus fontinalis* | 7 | 7 | 7 | 7 | 0 | 0 | 1 | 1 | 0 |
| *Sander lucioperca* | 9 | 9 | 9 | 9 | 2 | 2 | 6 | 6 | 0 |
| *Sarda sarda* | 3 | 3 | 3 | 3 | 2 | 2 | 4 | 4 | 2 |
| *Sardina pilchardus* | 140 | 140 | 140 | 140 | 158 | 158 | 163 | 163 | 140 |
| *Sarpa salpa* | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 5 | 0 |
| *Scardinius erythrophthalmus* | 14 | 14 | 14 | 14 | 1 | 1 | 1 | 1 | 1 |
| *Scomber scombrus* | 1 | 1 | 1 | 1 | 0 | 0 | 29 | 29 | 0 |
| *Scomberesox saurus* | 0 | 0 | 0 | 0 | 0 | 0 | 13 | 13 | 0 |
| *Scophthalmus maximus* | 1 | 1 | 1 | 1 | 1 | 1 | 2 | 2 | 1 |
| *Scophthalmus rhombus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Scorpaena scrofa* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Scyliorhinus canicula* | 1 | 1 | 1 | 1 | 0 | 0 | 2 | 2 | 0 |
| *Scyliorhinus stellaris* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Scymnodon ringens* | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 5 | 0 |
| *Seriola dumerili* | 1 | 0 | 1 | 3 | 0 | 0 | 44 | 44 | 0 |
| *Serranus cabrilla* | 0 | 0 | 0 | 0 | 0 | 0 | 100 | 100 | 0 |
| *Serrivomer beanii* | 0 | 0 | 0 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Sigmops bathyphilus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Silurus glanis* | 19 | 19 | 19 | 19 | 7 | 7 | 12 | 12 | 7 |
| *Simenchelys parasitica* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Solea solea* | 0 | 0 | 0 | 0 | 0 | 0 | 17 | 17 | 0 |
| *Somniosus microcephalus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Somniosus rostratus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Sparus aurata* | 0 | 0 | 0 | 0 | 1 | 1 | 5 | 5 | 0 |
| *Spectrunculus grandis* | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 1 | 0 |
| *Sphoeroides pachygaster* | 0 | 0 | 0 | 0 | 0 | 0 | 8 | 8 | 0 |
| *Sphyrna zygaena* | 0 | 0 | 0 | 1 | 0 | 0 | 7 | 7 | 0 |
| *Spondyliosoma cantharus* | 3 | 3 | 3 | 3 | 0 | 0 | 2 | 2 | 0 |
| *Squalius cephalus* | 14 | 14 | 14 | 14 | 1 | 1 | 4 | 4 | 1 |
| *Squalus acanthias* | 1 | 1 | 1 | 1 | 1 | 1 | 19 | 19 | 1 |
| *Squatina squatina* | 3 | 3 | 3 | 3 | 3 | 3 | 4 | 4 | 3 |
| *Sternoptyx diaphana* | 1 | 0 | 1 | 0 | 0 | 0 | 14 | 14 | 0 |
| *Stomias boa* | 1 | 1 | 1 | 1 | 1 | 1 | 3 | 3 | 1 |
| *Symbolophorus veranyi* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Symphodus bailloni* | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| *Syngnathus acus* | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 31 |
| *Syngnathus typhle* | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 39 |
| *Tetronarce nobiliana* | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 0 |
| *Thorogobius ephippiatus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Thunnus alalunga* | 1 | 0 | 1 | 1 | 0 | 0 | 17 | 17 | 0 |
| *Thunnus albacares* | 1 | 0 | 1 | 0 | 1 | 1 | 82 | 82 | 0 |
| *Thunnus thynnus* | 1 | 1 | 1 | 1 | 1 | 1 | 3 | 3 | 1 |
| *Thymallus thymallus* | 22 | 22 | 22 | 22 | 10 | 10 | 15 | 15 | 10 |
| *Tinca tinca* | 29 | 29 | 29 | 29 | 1 | 1 | 1 | 1 | 0 |
| *Torpedo marmorata* | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 1 | 1 |
| *Trachinotus ovatus* | 1 | 0 | 1 | 0 | 0 | 0 | 13 | 13 | 0 |
| *Trachinus draco* | 0 | 0 | 0 | 0 | 0 | 0 | 5 | 5 | 0 |
| *Trachurus trachurus* | 2 | 2 | 2 | 2 | 1 | 1 | 8 | 8 | 1 |
| *Trachyrincus scabrus* | 5 | 5 | 5 | 0 | 0 | 0 | 2 | 2 | 0 |
| *Trachyscorpia cristulata* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Trichiurus lepturus* | 9 | 3 | 9 | 1 | 1 | 0 | 106 | 106 | 0 |
| *Trigla lyra* | 0 | 0 | 0 | 0 | 10 | 10 | 5 | 5 | 0 |
| *Triglops murrayi* | 0 | 0 | 0 | 0 | 0 | 0 | 3 | 3 | 0 |
| *Trigonolampa miriceps* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Trisopterus luscus* | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| *Trisopterus minutus* | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 1 | 0 |
| *Xenodermichthys copei* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Xiphias gladius* | 0 | 0 | 0 | 0 | 0 | 0 | 77 | 77 | 20 |
| *Zameus squamulosus* | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| *Zeugopterus regius* | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| *Zeus faber* | 0 | 0 | 0 | 0 | 1 | 1 | 105 | 105 | 0 |
| *Zoarces viviparus* | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 |
