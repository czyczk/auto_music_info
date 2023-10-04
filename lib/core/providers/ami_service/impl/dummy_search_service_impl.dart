import 'package:auto_music_info/core/providers/ami_service/models/search_result_entry.dart';
import 'package:auto_music_info/core/providers/ami_service/models/search_results.dart';
import 'package:auto_music_info/core/providers/ami_service/models/search_source_enum.dart';
import 'package:auto_music_info/core/providers/ami_service/search_service.dart';

class DummySearchServiceImpl extends SearchService {
  final Map<SearchSourceEnum, List<SearchResultEntry>>
      _normalRealisticSearchResultMap = {
    SearchSourceEnum.wikipedia: [
      SearchResultEntry(
        title: 'The Best Damn Thing',
        url: 'https://en.wikipedia.org/wiki/The_Best_Damn_Thing',
        snippet:
            'The Best Damn Thing is the third studio album by Canadian singer-songwriter Avril Lavigne. It was released on April 11, 2007, by RCA Records. as her second ...',
        site: 'en.wikipedia.org',
      ),
      SearchResultEntry(
        title: 'Vivy -Fluorite Eye\'s Song',
        url: 'https://ja.wikipedia.org/wiki/Vivy_-Fluorite_Eye%27s_Song-',
        snippet:
            '『Vivy -Fluorite Eye\'s Song-』（ヴィヴィ フローライトアイズソング）はWIT STUDIO制作による日本のテレビアニメ作品。公式略称は「ヴィヴィ」。2021年4月から6月 ...',
        site: 'ja.wikipedia.org',
      ),
      SearchResultEntry(
        title: 'Ignorantes',
        url: 'https://en.wikipedia.org/wiki/Ignorantes',
        snippet:
            '"Ignorantes" is the first collaboration between Bad Bunny and Sech. The lyrics describe a person who laments a former lover but admits that the relationship ...',
        site: 'en.wikipedia.org',
      ),
      SearchResultEntry(
        title: 'South of the Border (Ed Sheeran song)',
        url:
            'https://en.wikipedia.org/wiki/South_of_the_Border_(Ed_Sheeran_song)',
        snippet:
            '"South of the Border" is a song by English singer-songwriter Ed Sheeran featuring Cuban-American singer Camila Cabello and Dominican-American rapper Cardi ...',
        site: 'en.wikipedia.org',
      ),
    ],
    SearchSourceEnum.musicPlatforms: [
      SearchResultEntry(
        title: 'The Best Damn Thing (Expanded Edition) - Album by Avril ...',
        url: 'https://open.spotify.com/album/6lqE05fiHWJVYYdMVJNj38',
        snippet:
            'Listen to The Best Damn Thing (Expanded Edition) on Spotify. Avril Lavigne · Album · 2007 · 17 songs.',
        site: 'open.spotify.com',
      ),
      SearchResultEntry(
        title: 'Sing My Pleasure - song and lyrics by ヴィヴィ(Vo.八木海莉)',
        url: 'https://open.spotify.com/track/6wOazYrDGLhMAhwU6RArlg',
        snippet:
            'Listen to Sing My Pleasure on Spotify. ヴィヴィ(Vo.八木海莉) · Song · 2021.',
        site: 'open.spotify.com',
      ),
      SearchResultEntry(
        title: '八木海莉/Sing My Pleasure - CDシングル',
        url: 'https://tower.jp/item/5178072/Sing-My-Pleasure',
        snippet:
            'Sing My Pleasure / ヴィヴィ(Vo.八木海莉) M2.オーディオドラマ「Happiness ... Sing My Pleasure -Instrumental- M5.Happiness -Instrumental-. 1. [CDシングル]. 1 ...',
        site: 'tower.jp',
      ),
      SearchResultEntry(
        title: 'Ignorantes - Single by Bad Bunny',
        url: 'https://open.spotify.com/album/7Hw9RJbQPN0gUx4xjgFLhj',
        snippet:
            'Listen to Ignorantes on Spotify. Bad Bunny · Single · 2020 · 1 songs.',
        site: 'open.spotify.com',
      ),
      SearchResultEntry(
        title: 'Ignorantes',
        url: 'https://y.qq.com/n/ryqq/mv/t0033urc6qt',
        snippet:
            'Bad Bunny/Sech. 关注. Ignorantes. 13. 7. Ignorantes-Bad Bunny/Sech/Benito A. Martinez Ocasio/Carlos Morales. QQ音乐. 打开QQ音乐再看一遍. 查看歌手. Bad Bunny.',
        site: 'y.qq.com',
      ),
      SearchResultEntry(
        title: 'Annabel/夜の国＜通常盤＞',
        url:
            'https://tower.jp/item/3906528/%E5%A4%9C%E3%81%AE%E5%9B%BD%EF%BC%9C%E9%80%9A%E5%B8%B8%E7%9B%A4%EF%BC%9E',
        snippet:
            '2015年7月放送のTVアニメ『GANGSTA.』のエンディング主題歌を収録したAnnabelのシングル。サウンド・プロデュースは同アニメのオープニング主題歌を手掛けるSTEREO ...',
        site: 'tower.jp',
      ),
      SearchResultEntry(
        title: 'South of the Border (feat. Camila Cabello & Cardi B)',
        url: 'https://open.spotify.com/track/4vUmTMuQqjdnvlZmAH61Qk',
        snippet:
            'South of the Border (feat. Camila Cabello & Cardi B). Ed Sheeran. No.6 Collaborations Project20193:24. Sign in to see lyrics and listen to the full track.',
        site: 'open.spotify.com',
      ),
      SearchResultEntry(
        title: 'future base - Single by Kizuna AI',
        url: 'https://open.spotify.com/album/4EXNitbM0G8ligJXUodkGE',
        snippet:
            'Listen to future base on Spotify. Kizuna AI · Single · 2018 · 1 songs.',
        site: 'open.spotify.com',
      ),
    ],
    SearchSourceEnum.other: [
      SearchResultEntry(
        title: 'Sing My Pleasure | Vivy: Fluorite Eye\'s Song Wiki | Fandom',
        url: 'https://vivy-fluorite-eyes-song.fandom.com/wiki/Sing_My_Pleasure',
        snippet:
            '"Sing My Pleasure" is the opening theme of the Vivy: Fluorite Eye\'s Song anime series, originally performed by Kairi Yagi, the singing voice of Vivy.',
        site: 'vivy-fluorite-eyes-song.fandom.com',
      ),
      SearchResultEntry(
        title: '夜の国 歌詞 Annabel GANGSTA. ED ふりがな付',
        url: 'https://utaten.com/lyric/ya15082611/',
        snippet:
            'Annabelが歌う夜の国(GANGSTA. ED)の歌詞ページ（ふりがな付）です。歌い出し「僕は忘れられた 灰積る街で 失くしものを探していた 赤い眼をした君が…',
        site: 'utaten.com',
      ),
      SearchResultEntry(
        title:
            'Maître Gims & Alvaro Soler - Paroles de "Lo Mismo" | Lyrics ...',
        url: 'https://www.azlyrics.com/lyrics/matregims/lomismo.html',
        snippet:
            'Maître Gims & Alvaro Soler Lyrics. "Lo Mismo" (feat. Jugglerz). Mes amis entendaient la vie que j\'ai ...',
        site: 'azlyrics.com',
      ),
      SearchResultEntry(
        title:
            'South of the Border (feat. Camila Cabello & Cardi B ... - YouTube',
        url: 'https://www.youtube.com/watch?v=UPOT2tgY9QQ',
        snippet:
            'South of the Border (feat. Camila Cabello & Cardi B ... - YouTube',
        site: 'www.youtube.com',
      ),
      SearchResultEntry(
        title: 'Kizuna AI - future base (Prod.Yunomi) - YouTube',
        url: 'https://www.youtube.com/watch?v=yeD7eAuza74',
        snippet: 'Kizuna AI - future base (Prod.Yunomi) - YouTube',
        site: 'www.youtube.com',
      ),
    ]
  };

  final Map<SearchSourceEnum, List<SearchResultEntry>> longTextSearchResultMap =
      {
    SearchSourceEnum.wikipedia: [
      SearchResultEntry(
        title:
            '111 Long long longlong long long longlong long long longlong long long longlong long long longlong title',
        url:
            'https://longlong.com/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long',
        snippet:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec purus sit amet erat maximus tempor. Mauris porta lectus nec turpis fringilla, ac ultricies libero molestie. Etiam at ornare nisi. Pellentesque vitae justo ut nibh fermentum faucibus. Nullam bibendum at lacus in bibendum. Sed bibendum elementum turpis, in fermentum ex dapibus quis. Sed consectetur orci quam, quis placerat elit venenatis et. Suspendisse ac pharetra leo. Morbi quis tempor nisi, bibendum lacinia nunc. Aenean quis finibus sem. Ut iaculis lacus sed posuere condimentum. Cras pretium dui nec iaculis accumsan. Proin eget scelerisque mi, non posuere odio. Sed bibendum sagittis nisi sed luctus.',
        site: 'longlong.com',
      ),
      SearchResultEntry(
        title:
            '222 Long long longlong long long longlong long long longlong long long longlong long long longlong title',
        url:
            'https://longlong.com/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long',
        snippet:
            'This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description.',
        site: 'longlong.com',
      ),
      SearchResultEntry(
        title:
            '333 Long long longlong long long longlong long long longlong long long longlong long long longlong title',
        url:
            'https://longlong.com/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long',
        snippet:
            'This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description.',
        site: 'longlong.com',
      ),
      SearchResultEntry(
        title:
            '444 Long long longlong long long longlong long long longlong long long longlong long long longlong title',
        url:
            'https://longlong.com/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long',
        snippet:
            'This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description.',
        site: 'longlong.com',
      ),
      SearchResultEntry(
        title:
            '555 Long long longlong long long longlong long long longlong long long longlong long long longlong title',
        url:
            'https://longlong.com/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long',
        snippet:
            'This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description.',
        site: 'longlong.com',
      ),
      SearchResultEntry(
        title:
            '666 Long long longlong long long longlong long long longlong long long longlong long long longlong title',
        url:
            'https://longlong.com/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long',
        snippet:
            'This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description.',
        site: 'longlong.com',
      ),
      SearchResultEntry(
        title:
            '777 Long long longlong long long longlong long long longlong long long longlong long long longlong title',
        url:
            'https://longlong.com/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long',
        snippet:
            'This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description.',
        site: 'longlong.com',
      ),
      SearchResultEntry(
        title:
            '888 Long long longlong long long longlong long long longlong long long longlong long long longlong title',
        url:
            'https://longlong.com/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long',
        snippet:
            'This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description.',
        site: 'longlong.com',
      ),
      SearchResultEntry(
        title:
            '999 Long long longlong long long longlong long long longlong long long longlong long long longlong title',
        url:
            'https://longlong.com/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long',
        snippet:
            'This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description.',
        site: 'longlong.com',
      ),
      SearchResultEntry(
        title:
            'aaa Long long longlong long long longlong long long longlong long long longlong long long longlong title',
        url:
            'https://longlong.com/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long/long',
        snippet:
            'This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description. This is a long description.',
        site: 'longlong.com',
      ),
    ],
  };

  final Map<SearchSourceEnum, List<SearchResultEntry>> jaSearchResultMap = {
    SearchSourceEnum.wikipedia: [
      SearchResultEntry(
        title: 'Vivy -Fluorite Eye\'s Song',
        url: 'https://ja.wikipedia.org/wiki/Vivy_-Fluorite_Eye%27s_Song-',
        snippet:
            '『Vivy -Fluorite Eye\'s Song-』（ヴィヴィ フローライトアイズソング）はWIT STUDIO制作による日本のテレビアニメ作品。公式略称は「ヴィヴィ」。2021年4月から6月 ...',
        site: 'ja.wikipedia.org',
      ),
    ],
    SearchSourceEnum.musicPlatforms: [
      SearchResultEntry(
        title: 'Sing My Pleasure - song and lyrics by ヴィヴィ(Vo.八木海莉)',
        url: 'https://open.spotify.com/track/6wOazYrDGLhMAhwU6RArlg',
        snippet:
            'Listen to Sing My Pleasure on Spotify. ヴィヴィ(Vo.八木海莉) · Song · 2021.',
        site: 'open.spotify.com',
      ),
      SearchResultEntry(
        title: '八木海莉/Sing My Pleasure - CDシングル',
        url: 'https://tower.jp/item/5178072/Sing-My-Pleasure',
        snippet:
            'Sing My Pleasure / ヴィヴィ(Vo.八木海莉) M2.オーディオドラマ「Happiness ... Sing My Pleasure -Instrumental- M5.Happiness -Instrumental-. 1. [CDシングル]. 1 ...',
        site: 'tower.jp',
      ),
    ],
    SearchSourceEnum.other: [],
  };

  final Map<SearchSourceEnum, List<SearchResultEntry>> zhCnSearchResultMap = {
    SearchSourceEnum.wikipedia: [
      SearchResultEntry(
        title: '七里香_百度百科',
        url:
            'https://baike.baidu.com/item/%E4%B8%83%E9%87%8C%E9%A6%99/12009481',
        snippet:
            '《七里香》是周杰伦演唱的歌曲，由方文山作词，周杰伦谱曲，钟兴民编曲，收录在周杰伦2004年8月3日发行的同名专辑《七里香》中。2004年，该曲获得香港TVB8十大金曲最佳 ...',
        site: 'baike.baidu.com',
      ),
    ],
    SearchSourceEnum.musicPlatforms: [
      SearchResultEntry(
        title: '七里香',
        url: 'https://y.qq.com/n/ryqq/songDetail/004Z8Ihr0JIu5s',
        snippet:
            '歌曲：七里香，歌手：周杰伦。七里香在线免费试听，更多周杰伦相关歌曲，尽在QQ音乐！QQ音乐是腾讯公司推出的一款网络音乐服务产品，海量音乐在线试听、新歌热歌在线 ...',
        site: 'y.qq.com',
      ),
    ],
  };

  final Map<SearchSourceEnum, List<SearchResultEntry>> zhTwSearchResultMap = {
    SearchSourceEnum.wikipedia: [
      SearchResultEntry(
        title: '七里香(專輯) - 維基百科，自由的百科全書',
        url:
            'https://zh.wikipedia.org/wiki/%E4%B8%83%E9%87%8C%E9%A6%99_(%E5%B0%88%E8%BC%AF)',
        snippet: '七里香(專輯) 編輯 ... 《七里香》是台灣歌手周杰倫發行第五張國語專輯。由台灣新力音樂於2004年8月3日發行。',
        site: 'zh.wikipedia.org',
      ),
    ],
    SearchSourceEnum.musicPlatforms: [
      SearchResultEntry(
        title: '七里香-歌詞-周杰倫(Jay Chou)',
        url: 'https://www.kkbox.com/hk/tc/song/SkZOLqKGFd6eC_yZeU',
        snippet:
            '作詞：方文山 作曲：周杰倫. 窗外的麻雀在電線桿上多嘴妳說這一句很有夏天的感覺手中的鉛筆在紙上來來回回我用幾行字形容妳是我的誰 秋刀魚的滋味貓跟妳都想瞭解初戀的 ...',
        site: 'www.kkbox.com',
      ),
    ],
  };

  @override
  Future<SearchResults> searchWithKeyword(String keyword) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (keyword.contains('long')) {
      return SearchResults(
        serviceProvider: 'Google',
        query: keyword,
        resultMap: longTextSearchResultMap,
      );
    } else if (keyword.contains("ja")) {
      return SearchResults(
        serviceProvider: 'Google',
        query: keyword,
        resultMap: jaSearchResultMap,
      );
    } else if (keyword.contains("zhCn")) {
      return SearchResults(
        serviceProvider: 'Google',
        query: keyword,
        resultMap: zhCnSearchResultMap,
      );
    } else if (keyword.contains("zhTw")) {
      return SearchResults(
        serviceProvider: 'Google',
        query: keyword,
        resultMap: zhTwSearchResultMap,
      );
    } else {
      return SearchResults(
        serviceProvider: 'Google',
        query: keyword,
        resultMap: _normalRealisticSearchResultMap,
      );
    }
  }
}
