# AngularFrontend

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 7.3.4.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).

#Business logic

## Registration
1. Type		(Személyautó, Haszonjármű, Motorkerékpár, Autóbusz, Harcjármű, Szolgálati autók, Egyéb)

1a. OtherType (Egyéb jármű esetén, hintó, kerékpár)

2. Make		(Gyártmány) autocomplete

3. Model 	(Modell)

4. Body 	(Pickup, Terepjáró, Buggy, Cabrio, Coupe, Egyterű, Ferdehátú, Hot rod, Kisbusz, Kombi, Lépcsőshátú, Mopedautó, Sedan, Sport, 				Városi terepjáró (crossover), Egyéb, Nem releváns) - nem kötelező

5. Állapot	(Üzemképes, Nem üzemképes, Forgalomban van, Nincs forgalomban)

7. Üzemanyag

9. Colour	(barna, sötétbarna, világosbarna, bézs, bíborvörös, bordó, ezüst, fehér, törtfehér, fekete, homok, ibolya, kék, ibolyakék, óceánkék, sötétkék, világoskék, lila, narancs, okker, pezsgő, piros, rózsaszín, sárga, aranysárga, citromsárga, narancssárga, szürke, sötétszürke, világosszürke, terep, türkiz, vajszínű, zöld, olajzöld, sötétzöld, világoszöld)

10. Year (évjárat, mettől meddig ajánlja)

11. Role (játszó autó, statiszta autó, mindkettő)

12. Korszak (időszak amiben hitelesen szerepelhet)

13. Oldtimer (checkbox)

14. Megkülönbőztető jelzés (checkbox)

15. Napi bérletidíj

16. only with Driver (only the owner can drive it)

17. Számlaképes (private or business)
