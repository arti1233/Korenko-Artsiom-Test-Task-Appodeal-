# Test Task Appodeal

## Задание 1

Подготовить деловое письмо-ответ на вопрос клиента:

Hello, team!

We got an email from google play about violations of their rules. They told us that we place interstitial ads so that they suddenly appear when a user is focused on a task at hand (e.g. playing a game, filling out a form, reading content) may lead to accidental clicks and often creates a frustrating user experience(see on the screenshot below).
Could you please describe how we can fix it? 

Kind regards.

### Мой ответ 

Dear [Client's Name],

We have received your message regarding the Google Play policy violation related to the placement of interstitial ads within your app. To fix this situation we would like to offer the following two solutions:

1.  Replace the interstitial ad with other ad types. For example banner (more information here https://docs.appodeal.com/android/ad-types/banner) or MREC (more information here https://docs.appodeal.com/android/ad-types/mrec). These ad types will minimize unintentional clicks and user frustration while still allowing the ad to be displayed on the Home screen.

2. Move the  interstitial ad to another screen within the app, preferably at a location that is less likely to disrupt the user's experience and will successfully address the concerns raised by Google Play.

We value your business and strive to provide the best service possible. Please don't hesitate to reach out to us if you have any further questions or need assistance.

Best regards,

Artsiom Karenka

## Задание 2 

Зарегистрируйтесь в www.appodeal.com и загрузите Appodeal SDK для Android или iOS. Создайте приложение в которое нужно интегрировать Appodeal SDK. Приложение должно содержать активити с несколькими кнопками по центру экрана:

1) Кнопка Banners: при нажатии на кнопку будут появляться баннеры сверху (BANNER_TOP). На время показа других типов рекламы, необходимо скрывать баннеры. После показа 5 баннеров необходимо скрыть этот тип рекламы

![Screen Recording 2023-09-22 at 20 35 16](https://github.com/arti1233/TestTaskAppodeal/assets/107428500/010a592e-c79b-4aa0-95d4-d4c36a7cb981)

2) Кнопка Interstitials: При нажатии на кнопку будут отображаться interstitial. Показывать interstitials не чаще чем раз в минуту. Когда показ сделать невозможно, кнопка должна быть не активной.
   
3) Кнопка Rewarded Video должна быть активна только при наличии загруженного rewarded video. За одну сессию нельзя показать больше 3х rewarded video. Когда показ сделать невозможно, кнопка должна быть не активной.

![Screen Recording 2023-09-22 at 20 46 23](https://github.com/arti1233/TestTaskAppodeal/assets/107428500/9065bea9-4a79-4c27-92c0-3fa2f9727a3f)

4) Кнопка Native: При нажатии на кнопку будет появляться ListView / UITableView со встроенной нативной рекламой (не менее 3 штук).

![Screen Recording 2023-09-22 at 20 50 59](https://github.com/arti1233/TestTaskAppodeal/assets/107428500/cd3c80f1-9810-4dea-9c2e-27b69f903796)

При разработке необходимо учесть, что экран может меняться как в portrait, так и в landscape ориентацию. Можно использовать тестовый режим (test mode) для отображения рекламы.


![Screen Recording 2023-09-22 at 20 56 55 (2)](https://github.com/arti1233/TestTaskAppodeal/assets/107428500/94805c26-0392-48d7-b143-fd4809072f1d)





