//
//  Content.swift
//  Day3Homework
//
//  Created by 柳田昌弘 on 2020/12/03.
//

import Foundation

func randomValue<T>(_ array: [T]) -> T {
    let random = Int(arc4random()) % array.count
    return array[random]
}

class Content {
    var name: String = ""
    var address: String = ""
    var iconName: String = "userIcon"
    var imageName: String = "sample"
    var introduction: String = """
初代ビーコンズフィールド伯爵ベンジャミン・ディズレーリ（Benjamin Disraeli, 1st Earl of Beaconsfield, KG, PC, FRS、1804年12月21日 - 1881年4月19日）は、イギリスの政治家、小説家、貴族。
ユダヤ人でありながら保守党内で上り詰めることに成功し、ダービー伯爵退任後に代わって保守党首となり、2期にわたって首相（在任：1868年、1874年 - 1880年）を務めた。庶民院の過半数を得られていなかった第一次内閣は短命の選挙管理内閣に終わったが、庶民院の過半数を制していた第二次内閣は「トーリー・デモクラシー（Tory democracy）」と呼ばれる一連の社会政策の内政と帝国主義の外交を行って活躍した。自由党のウィリアム・グラッドストンと並んでヴィクトリア朝の政党政治を代表する人物である。また、小説家としても活躍した。野党期の1881年に死去し、以降ソールズベリー侯爵が代わって保守党を指導していく。
"""
    var media: [BrandIcon] {
        var ret = [BrandIcon]()
        if (randomValue([true, false])) {
            ret.append(.twitter)
        }
        if (randomValue([true, false])) {
            ret.append(.instagram)
        }
        if (randomValue([true, false])) {
            ret.append(.reddit)
        }
        if (randomValue([true, false])) {
            ret.append(.snapchat)
        }
        if (randomValue([true, false])) {
            ret.append(.line)
        }
        if (randomValue([true, false])) {
            ret.append(.whatsapp)
        }
        if (randomValue([true, false])) {
            ret.append(.fbmessenger)
        }
        return ret
    }
    
    static func create() -> Content {
        // https://yamagata.int21h.jp/tool/testdata/
        let ret = Content()
        ret.name = randomValue(["佐久間大輝","島奈穂","岩佐泰賀","西結羽","二瓶輝男","室井孝治","三谷和花","畠山富男","深沢由太郎","梅原誠二","上原時子","斉藤琉叶","塩谷亘","岸田祐希","猪俣力","大友真希","高坂喜久雄","三宅光枝","小幡海斗","三木尚生","重松沙耶","山村洋司","阪本剣都","熊谷忠一","福井蒼依","澤田早希","荻野道世","田川京子","谷川悟","滝田弘之"])
        ret.address = randomValue(["青森県 五所川原市 不魚住 1-12-13 不魚住マンション310","千葉県 白井市 中 2-6-12","新潟県 三条市 吉野屋 2-11","福岡県 朝倉市 金丸 3-7-15","山梨県 南アルプス市 有野 1-20-6 ヴィレッジ有野205","宮崎県 日向市 浜町 2-12 テラス浜町409","福島県 大沼郡会津美里町 橋丸 1-11","沖縄県 那覇市 松山 2-14","鳥取県 倉吉市 広瀬 1-7 広瀬ガーデン110","広島県 呉市 音戸町波多見 4-11-17","新潟県 村上市 中川原団地 1-7-10 ダイヤモンド中川原団地412","宮城県 気仙沼市 長崎 4-10-20","長野県 小諸市 鴇久保 2-4-18 鴇久保ヴィレッジ209","奈良県 奈良市 佐保台西町 2-4-18","熊本県 人吉市 中青井町 4-19-5","宮崎県 都城市 関之尾町 4-12 関之尾町グリーン418","岩手県 盛岡市 大慈寺町 3-1 大慈寺町荘402","茨城県 行方市 青沼 1-5 青沼ハイツ101","石川県 輪島市 房田町 3-12-11","愛知県 瀬戸市 前田町 1-10-11","滋賀県 大津市 音羽台 3-7-3 音羽台ロイヤル100","大分県 大分市 福宗 1-15-14","東京都 港区 芝公園 3-17-10","埼玉県 春日部市 樋籠 3-1-5 レジデンス樋籠405","鹿児島県 南九州市 頴娃町御領 4-3-13 頴娃町御領荘219","兵庫県 たつの市 揖西町佐江 4-19-17","広島県 廿日市市 佐方 2-20-6 佐方スカイ109","長野県 安曇野市 明科東川手 2-11-5","富山県 高岡市 若保町 4-17-12","滋賀県 長浜市 錦織町 2-19"])
        return ret
    }
}
