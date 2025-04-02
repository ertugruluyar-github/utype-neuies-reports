# turkiye-neu-ies-thesis-and-term-project
Necmettin Erbakan Üniversitesi Eğitim Bilimleri Enstitiüsü lisansüstü eğitim için **RESMÎ OLMAYAN** tez önerisi, tez ve dönem projesi şablonudur. [**UNOFFICIAL** thesis proposal, thesis and term project template for graduate education at Necmettin Erbakan University Institute of Educational Sciences.]


## İçindekiler [Table of Contents]
- [turkiye-neu-ies-thesis-and-term-project](#turkiye-neu-ies-thesis-and-term-project)
  - [İçindekiler \[Table of Contents\]](#i̇çindekiler-table-of-contents)
  - [Türkçe](#türkçe)
    - [Tanıtım Videosu](#tanıtım-videosu)
    - [Teşekkür](#teşekkür)
    - [Kullanılan Paketler](#kullanılan-paketler)
    - [Özellikler](#özellikler)
    - [Kullanım](#kullanım)
    - [Kurulum](#kurulum)
      - [Gerekli Yazılımlar](#gerekli-yazılımlar)
      - [Çevrim İçi](#çevrim-i̇çi)
        - [Şablonu Typst.app Web Sitesinden Kullanmak](#şablonu-typstapp-web-sitesinden-kullanmak)
        - [Şablonu Tinymist Typst Visual Studio Code Uzantısıyla Kullanmak](#şablonu-tinymist-typst-visual-studio-code-uzantısıyla-kullanmak)
      - [Çevrim Dışı](#çevrim-dışı)
  - [English](#english)
    - [Trailer Video](#trailer-video)
    - [Acknowledgement](#acknowledgement)
    - [Packages Used](#packages-used)
    - [Features](#features)
    - [Usage](#usage)
    - [Installation](#installation)
      - [Required Softwares](#required-softwares)
      - [Online](#online)
        - [Using the Template from the Typst.app Website](#using-the-template-from-the-typstapp-website)
        - [Using the Template with the Tinymist Typst Visual Studio Code Extension](#using-the-template-with-the-tinymist-typst-visual-studio-code-extension)
      - [Offline](#offline)

## Türkçe

### Tanıtım Videosu
TODO

### Teşekkür
Bu proje yazılmadan önce ve sonrasında aşağıdaki projeler incelenerek bazı durumlarda fikir almak için yararlanılmıştır:
- [typst-thesis-template](https://github.com/mrtz-j/typst-thesis-template): Moritz Jörg <@mrtz-j> ve Ole Tytlandsvik <@otytlandsvik>. ([Typst Universe Bağlantısı](https://typst.app/universe/package/modern-uit-thesis))
- [parcio-typst](https://github.com/xkevio/parcio-typst): Kevin Kulot <@xkevio>. ([Typst Universe Bağlantısı](https://typst.app/universe/package/parcio-thesis))
- [aiaa-typst](https://github.com/isaacew/aiaa-typst): <@isaacew> ve Alexander Von Moll <@avonmoll>. ([Typst Universe Bağlantısı](https://typst.app/universe/package/bamdone-aiaa))
- [ThesIST](https://github.com/tfachada/thesist): Tomás Fachada <@tfachada> ve ThesIST katkıda bulunanlar. ([Typst Universe Bağlantısı](https://typst.app/universe/package/thesist))

Bu projelerde emeği geçen herkese çok büyük teşekkürlerimi sunarım.

Ve ayrıca [Typst YouTube Oynatma Listesi](https://youtube.com/playlist?list=PLCO-MGSsHcdArXIfeOGoUwjH0oz8vMr8M&si=c_kTmN4FKmwdMitE) için <@isaacew>'e büyük teşekkürlerimi sunarım.

### Kullanılan Paketler
- Çoklu dil desteği sağlamak için. -> [Linguify](https://github.com/typst-community/linguify): <@jomaway>, <@SillyFreak> ve katkıda bulunanlar. ([Typst Universe Bağlantısı](https://typst.app/universe/package/linguify/))

Bu projelerde emeği geçen herkese çok büyük teşekkürlerimi sunarım.

### Özellikler
- [x] Tek şablonda tez, tez önerisi ve dönem projesi yazılabilir. Örneğin, tez önerinizi bitirdikten sonra bunun koddaki şablon ayarları kısmını (`#show: template-configurations.with(...)`) yorum satırı yaparak pasif hale getirdikten sonra tez için yeni bir şablon ayarı oluşturarak tezinizi yazmaya devam edebilirsiniz. Böylece, tek projede hem tez önerinizi hem de tezinizi yazabilir ve istediğiniz zaman istediğiniz çıktıyı elde edebilirsiniz.
- [x] ~%99 oranında otomatik olarak şablon kurallarına uygun olarak içeriği düzenler. Otomatik olarak henüz yapılamayan bazı durumlar aşağıdaki gibidir:
  - [ ] Şekillerin içerisinde alt şekillerin koyulması. Bu özellik için gerekli altyapının sağlanması beklenmektedir. Bunu yapmak için şimdilik [subpar](https://typst.app/universe/package/subpar) Typst Universe paketi kullanılabilir.
  - [ ] Tablo başlıkları otomatik olarak tekrar edememekte ve tekrar eden başlıkların ana başlıktan farklı olamamaktadır. Figür başlıklarının tekrar etmesi ve tekrar eden başlıkların ana başlıktan farklı olmasını sağlayacak özellikler gelene kadar tablolar bölünemez şeklinde kalmalıdır. Bu özellik için gerekli altyapının sağlanması beklenmektedir. Bunu yapmak için, şimdilik özel fonksiyon oluşturulabilir (Bakınız: https://github.com/typst/typst/issues/5057#issuecomment-2399903391).
  - [ ] Tabloların başlık satırlarının koyu yazılması sadece tablonun ilk satırı için otomatik olarak olmaktadır. Eğer tablonun başlık kısmı iki ya da daha fazla satırdan oluşuyorsa bu satırların içeriği elle (manuel) olarak koyu yazılması gerekmektedir. İleriki Typst sürümlerinde bunun otomatik olarak yapılması için gerekli altyapının sağlanması beklenmektedir.
  - [ ] Tabloların başlık kısmının üstündeki ve altındaki kenarlıklar otomatik olarak koyulmaktadır. Eğer tablonun başlık kısmı iki ya da daha fazla satırdan oluşuyorsa bu satırların arasındaki kenarlıkların elle (manuel) olarak koyulması gerekmektedir. İleriki Typst sürümlerinde bunun otomatik olarak yapılması için gerekli altyapının sağlanması beklenmektedir.
  - [ ] Tablonun açıklamasının yer aldığı son satırın genişliğinin yani kaç sütunun birleşimi kadar olacağını elle (manuel) olarak belirtmek gerekmektedir. İleriki Typst sürümlerinde bunun otomatik olarak yapılması için gerekli altyapının sağlanması beklenmektedir.
  - [ ] Tablonun açıklamasının yer aldığı son satırın altındaki kenarlığın elle (manuel) olarak kaldırılması gerekmektedir. İleriki Typst sürümlerinde bunun otomatik olarak yapılması için gerekli altyapının sağlanması beklenmektedir.
  - [ ] Tablonun açıklamasının yer aldığı son satırın içeriğinin sola hizalanmasını elle (manuel) olarak belirtmek gerekmektedir. İleriki Typst sürümlerinde bunun otomatik olarak yapılması için gerekli altyapının sağlanması beklenmektedir.
- [x] Tablo, şekil ve kod figürlerinin otomatik olarak numaralandırılması sağlanmaktadır. Araya yeni bir figür eklendiğinde numaralandırma otomatik olarak güncellenmektedir. Aynı şekilde, bu figürlere metin içinde yapılan atıflardaki numaralandırmalar da otomatik olarak güncellenmektedir.
- [x] Çoklu dil desteği (Türkçe ve İngilizce) vardır.
- [x] Açılır liste mantığında tanımlanmış bilgiler içerisinden seçim yapılabilmesi sağlanarak hata yapılması ihtimalini azaltmak.

### Kullanım
Öncelikle, şablonu projeniz için içe aktarınız. Daha sonra, şablonun ayarlarını giriniz.

**NOT:** Şablonu [Kurulum](#kurulum) başlığında bahsedildiği gibi kullandığınızda bu kısım otomatik olarak mevcut olacaktır. Sadece şablon ayarlarındaki bilgileri projenize güncellemeniz yeterlidir.

<details>
  <summary>Kodu göstermek/gizlemek için tıklayınız</summary>

```typst
// Şablonu, Kurulum başlığında bahsedilden durumlardan size uygun olana göre içe aktarınız:
#import "@preview/turkiye-neu-ies-thesis-and-term-project:0.1.0": (
  template-configurations,
  LANGUAGES,
  REPORT-TYPES,
  DEPARTMENTS,
  PROGRAMS,
  ACADEMIC-MEMBER-TITLES,
)

// Şablonun ayarlarını giriniz.
#show: template-configurations.with(
  ...
)
```

</details>

TODO: Birden fazla başlık seçeneği olan yerlerde bir başlığı seçmenin nasıl yapılacağını göster.

### Kurulum

#### Gerekli Yazılımlar
- [Typst](https://typst.app/): Typst'ın resmi kod düzenleyicisidir.

    YA DA

- [Visual Studio Code](https://code.visualstudio.com/): Typst kodlarını yazmak için kullanılabilen bir kod düzenleyicisidir.
- [Tinymist Typst Visual Studio Code Uzantısı](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist): Typst kodlarını yazarken yardımcı olan ve eş zamanlı çıktıyı görüntüleme imkanı sağlayan bir uzantıdır.

#### Çevrim İçi

##### Şablonu [Typst.app](https://typst.app/) Web Sitesinden Kullanmak
Bu durumda internete her zaman bağlı olmanız gerekmektedir.

##### Şablonu [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) [Visual Studio Code](https://code.visualstudio.com/) Uzantısıyla Kullanmak
Bu durumda, ilk defa şablonu indirirken internete ihtiyaç vardır. İlk indirme işleminden sonra internete bağlı olmadan kullanılabilir ve şablonun farklı bir sürümünü indirmek veya yeni bir sürümüne geçmek istediğinizde anlık olarak internete ihtiyaç vardır. Sonrasında internete bağlı olmadan kullanmaya devam edilebilir.

Şablonu yukarıda bahsedilen araçlarla çevrim içi kullanmak için aşağıdaki gibi içe aktarma yapabilirsiniz:

**NOT:** [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) uzantısının 'Template Gallery'si üzerinden bir şablonu seçerek proje oluşturduğunuzda bu şekilde içe aktarma yapabilirsiniz.
<details>
  <summary>Kodu göstermek/gizlemek için tıklayınız</summary>

```typst
#import "@preview/turkiye-neu-ies-thesis-and-term-project:0.1.0": (
  template-configurations,
  LANGUAGES,
  REPORT-TYPES,
  DEPARTMENTS,
  PROGRAMS,
  ACADEMIC-MEMBER-TITLES,
)
```

</details>

#### Çevrim Dışı
Şablonu çevrim dışı kullanmak için [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) [Visual Studio Code](https://code.visualstudio.com/) uzantısını kullanabilirsiniz.

Şablonu [adresindeki](https://github.com/typst/packages/?tab=readme-ov-file#local-packages) bahsedilen konuma indirerek kullanıyorsanız aşağıdaki gibi içe aktarma yapabilirsiniz:

<details>
  <summary>Kodu göstermek/gizlemek için tıklayınız</summary>

  ```typst
  #import "@local/turkiye-neu-ies-thesis-and-term-project:0.1.0": (
    template-configurations,
    LANGUAGES,
    REPORT-TYPES,
    DEPARTMENTS,
    PROGRAMS,
    ACADEMIC-MEMBER-TITLES,
  )
  ```

</details>

Şablonu, şablonun bütün dosyalarının bulunduğu [Geliştirici GitHub Reposu](https://github.com/ertugruluyar-github/turkiye-neu-ies-thesis-and-term-project) üzerinden manuel olarak bilgisayarınızda istediğiniz herhangi bir konuma indirerek kullanıyorsanız aşağıdaki gibi içe aktarma yapabilirsiniz:

<details>
  <summary>Kodu göstermek/gizlemek için tıklayınız</summary>

  ```typst
  #import "/src/lib.typ": (
    template-configurations,
    LANGUAGES,
    REPORT-TYPES,
    DEPARTMENTS,
    PROGRAMS,
    ACADEMIC-MEMBER-TITLES,
  )
  ```

</details>

## English

### Trailer Video
TODO

### Acknowledgement
Before and after writing this project, the following projects were examined and in some cases used for ideas:
- [typst-thesis-template](https://github.com/mrtz-j/typst-thesis-template): Moritz Jörg <@mrtz-j> and Ole Tytlandsvik <@otytlandsvik>. ([Typst Universe Link](https://typst.app/universe/package/modern-uit-thesis))
- [parcio-typst](https://github.com/xkevio/parcio-typst): Kevin Kulot <@xkevio>. ([Typst Universe Link](https://typst.app/universe/package/parcio-thesis))
- [aiaa-typst](https://github.com/isaacew/aiaa-typst): <@isaacew> and Alexander Von Moll <@avonmoll>. ([Typst Universe Link](https://typst.app/universe/package/bamdone-aiaa))
- [ThesIST](https://github.com/tfachada/thesist): Tomás Fachada <@tfachada> and ThesIST contributors. ([Typst Universe Link](https://typst.app/universe/package/thesist))

I sincerely thank everyone who contributed to these projects.

And also a big thank you to <@isaacew> for [Typst YouTube Playlist](https://youtube.com/playlist?list=PLCO-MGSsHcdArXIfeOGoUwjH0oz8vMr8M&si=c_kTmN4FKmwdMitE). It was very helpfull to start Typst.

### Packages Used
- To provide multi language support. -> [Linguify](https://github.com/typst-community/linguify): <@jomaway>, <@SillyFreak> and contributors. ([Typst Universe Link](https://typst.app/universe/package/linguify/))

I sincerely thank everyone who contributed to these projects.

### Features
- [x] It can be written thesis, thesis proposal and term project in a single template. For example, after completing your thesis proposal, you can comment out the template settings section in the code (`#show: template-configurations.with(...)`) and create a new template setting for the thesis and continue writing your thesis. Thus, you can write both your thesis proposal and your thesis in a single project and get the output you want at any time.
- [x] It automatically arranges the content in accordance with the template rules at a rate of ~%99. Some situations that cannot be done automatically yet are as follows:
  - [ ] Placing sub-figures inside figures. The necessary infrastructure is expected to be provided for this feature. For now, the [subpar](https://typst.app/universe/package/subpar) Typst Universe package can be used to do this.
  - [ ] Table captions cannot repeat automatically and repeated captions cannot be different from the main caption. Tables should remain non-splittable until there are features that allow figure captions to repeat and repeat captions to be different from the main caption. The necessary infrastructure is expected to be provided for this feature. For now, a custom function can be created to do this (see: https://github.com/typst/typst/issues/5057#issuecomment-2399903391).
  - [ ] Writing the header lines of tables in bold is only done automatically for the first line of the table. If the header part of the table consists of two or more lines, the content of these lines must be written in bold manually. The necessary infrastructure is expected to be provided in future versions of Typst to do this automatically.
  - [ ] The borders above and below the header part of the tables are automatically put in bold. If the header part of the table consists of two or more lines, the borders between these lines must be put in bold manually. The necessary infrastructure is expected to be provided in future versions of Typst to do this automatically.
  - [ ] It is necessary to manually specify the width of the last line containing the description of the table, that is, how many columns will be combined. The necessary infrastructure is expected to be provided in future versions of Typst to do this automatically.
  - [ ] The bottom border of the last line containing the description of the table must be removed manually. The necessary infrastructure is expected to be provided in future versions of Typst to do this automatically.
  - [ ] It is necessary to manually specify that the content of the last line containing the description of the table is left-aligned. The necessary infrastructure is expected to be provided in future versions of Typst to do this automatically.
- [x] Automatic numbering of table, image and code figures is provided. The numbering is automatically updated when a new figure is inserted. Likewise, the numbering of references to these figures in the text is also automatically updated.
- [x] Multi-language support (Turkish and English) is available.
- [x] Reducing the possibility of making mistakes by providing the ability to choose from the information defined in the logic of the drop-down list.

### Usage
First, import the template for your project. Then, enter the template configurations.

**NOTE:** When you use the template as mentioned in the [Installation](#installation) section, this part will be automatically available. You only need to update the information in the template configurations to your project.

<details>
  <summary>Click to show/hide code</summary>

```typst
// Import the template according to the appropriate situation mentioned in the Installation section:
#import "@preview/turkiye-neu-ies-thesis-and-term-project:0.1.0": (
  template-configurations,
  LANGUAGES,
  REPORT-TYPES,
  DEPARTMENTS,
  PROGRAMS,
  ACADEMIC-MEMBER-TITLES,
)

// Enter the template configurations.
#show: template-configurations.with(
  ...
)
```

</details>

### Installation

#### Required Softwares
- [Typst](https://typst.app/): Typst is the official code editor.

    OR

- [Visual Studio Code](https://code.visualstudio.com/): It is a code editor that can be used to write Typst codes.
- [Tinymist Typst Visual Studio Code Extension](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist): It is an extension that helps writing Typst codes and provides simultaneous output viewing.

#### Online

##### Using the Template from the [Typst.app](https://typst.app/) Website
In this case, you need to be connected to the internet at all times.

##### Using the Template with the [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) [Visual Studio Code](https://code.visualstudio.com/) Extension
In this case, you need the internet when downloading the template for the first time. After the first download, it can be used without being connected to the internet, and you need the internet momentarily when you want to download a different version of the template or switch to a new version. Afterwards, you can continue to use it without being connected to the internet.

To use the template online with the tools mentioned above, you can import it as follows:

**NOTE:** When you create a project by selecting a template from the 'Template Gallery' of the [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) extension, you can import it in this way.
<details>
  <summary>Click to show/hide code</summary>

```typst
#import "@preview/turkiye-neu-ies-thesis-and-term-project:0.1.0": (
  template-configurations,
  LANGUAGES,
  REPORT-TYPES,
  DEPARTMENTS,
  PROGRAMS,
  ACADEMIC-MEMBER-TITLES,
)
```

</details>

#### Offline
You can use the [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) [Visual Studio Code](https://code.visualstudio.com/) extension to use the template offline.

If you are using the template by downloading it to the location mentioned [here](https://github.com/typst/packages/?tab=readme-ov-file#local-packages), you can import it as follows:

<details>
  <summary>Click to show/hide code</summary>

  ```typst
  #import "@local/turkiye-neu-ies-thesis-and-term-project:0.1.0": (
    template-configurations,
    LANGUAGES,
    REPORT-TYPES,
    DEPARTMENTS,
    PROGRAMS,
    ACADEMIC-MEMBER-TITLES,
  )
  ```

</details>

If you are using the template by manually downloading it to any location on your computer from the [Developer GitHub Repo](https://github.com/ertugruluyar-github/turkiye-neu-ies-thesis-and-term-project) where all the template files are located, you can import it as follows:

<details>
  <summary>Click to show/hide code</summary>

  ```typst
  #import "/src/lib.typ": (
    template-configurations,
    LANGUAGES,
    REPORT-TYPES,
    DEPARTMENTS,
    PROGRAMS,
    ACADEMIC-MEMBER-TITLES,
  )
  ```

</details>