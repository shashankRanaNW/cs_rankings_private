# _Desi_ CS Rankings

This ranking of top computer science schools is designed to identify institutions and faculty actively engaged in research across a number of areas of computer science. The comparison between the departments of Computer Science around the world is metric based and is dependent on sum of adjusted-counts of all professors in one university.

_Desi_ CS rankings indexes **CORE journals** to compute rankings.

While the original CS Rankings website is dependent on hard-coding the various information about conferences, our website does not need that, and the extraction of information for various conferences has been now automated.

Our website, again including the features of original CS website and allows users to view the respective conferences in all combinations of CORE rankings and four major domains, which include Artifical Intelligence, Theory, Systems and Interdisciplinary Subjects.

Our _Desi_ CS Rankings website is hosted on https://core-cs-rankings.web.app which has been implemented with CI/CD i.e. Continuous Integration/ Continuous Deployment. This implies that once a new PR has been merged on the remote repository, those changes are pushed to production and deployed live on the website.

---

## Salient Features

- Conferences considered can be filtered by the ratings (A*, A, B) via check boxes.

- The conferences have been merged with their rating and domain in a combined table, finally to be presented in a visually good-looking website.

- Specific domains of CS ( AI, systems ) can be filtered for ranking, selected via a check boxes.

- The tedious process of hard-coding has been avoided , with the data and rating of conferences being scraped from CORE website directly.

- Users have the choice to look at just the SIGs that they find interesting. This way, they can focus on the areas of computer science that they care about most.

This repository contains all code and data used to build the Desi CS rankings website, have been hosted here locally

## Making and updation

Use ``make`` for making all intermediate tables.
``make clean`` removes redundant files, use this before pushing.
