namespace :dev do
  task set_freeway: :environment do
    DATA = [
        {
          name: '國一',
          detail: [
            {name: '基隆端', cityN: '基隆市區、西岸碼頭', cityS: '------', km: 0, coordsN: '25.124033,121.736483', coordsS: ''},
            {name: '基隆交流道', cityN: '八堵、金山', cityS: '八堵、金山', km: 1, coordsN: '25.113898,121.728393', coordsS: '25.115379,121.727213'},
            {name: '八堵交流道', cityN: '暖暖、瑞芳', cityS: '------', km: 2, coordsN: '25.104828,121.726478', coordsS: ''},
            {name: '大華系統交流道', cityN: '連接台62(萬里瑞濱)線快速公路', cityS: '------', km: 5, coordsN: '', coordsS: ''},
            {name: '五堵交流道', cityN: '五堵', cityS: '五堵', km: 6, coordsN: '25.084953,121.685562', coordsS: '25.088164,121.687236'},
            {name: '汐止交流道', cityN: '汐止', cityS: '汐止、國道3號', km: 10, coordsN: '25.071621,121.652498', coordsS: '25.069340,121.654993'},
            {name: '汐止系統交流道', cityN: '連接國道3號', cityS: '連接國道3號', km: 11, coordsN: '', coordsS: ''},
            {name: '高架道路汐止端', cityN: '連接汐止五股高架道路', cityS: '連接汐止五股高架道路', km: 13, coordsN: '', coordsS: ''},
            {name: '東湖交流道', cityN: '康寧路', cityS: '------', km: 15, coordsN: '25.064872,121.610790', coordsS: ''},
            {name: '內湖交流道', cityN: '成功路', cityS: '南京東路（A）成功路（B）', km: 17, coordsN: '25.063072,121.590850', coordsS: '25.063072,121.590850'},
            {name: '圓山交流道', cityN: '濱江街（A）建國北路、松江路（B）', cityS: '建國北路', km: 23, coordsN: '25.068655,121.533294', coordsS: '25.068655,121.533294'},
            {name: '台北交流道', cityN: '重慶北路', cityS: '士林（A）台北市區（B）', km: 25, coordsN: '25.075765,121.513933', coordsS: '25.075765,121.513933'},
            {name: '三重交流道', cityN: '三重', cityS: '三重', km: 27, coordsN: '25.072640,121.493738', coordsS: '25.072640,121.493738'},
            {name: '五股轉接道', cityN: '連接汐五高架道路', cityS: '連接汐五高架道路', km: 32, coordsN: '', coordsS: ''},
            {name: '五股交流道', cityN: '五股、新莊', cityS: '五股、新莊', km: 33, coordsN: '25.074124,121.436520', coordsS: '25.074124,121.436520'},
            {name: '泰山轉接道', cityN: '連接五楊高架道路', cityS: '連接五楊高架道路', km: 35, coordsN: '', coordsS: ''},
            {name: '林口交流道', cityN: '林口、龜山、文化一路（A ）林口、龜山、文化北路（B）', cityS: '林口、龜山、文化一路（A ）林口、龜山、文化北路（B）', km: 41, coordsN: '25.067421,121.369120', coordsS: '25.067421,121.369120'},
            {name: '桃園交流道', cityN: '桃園、南崁', cityS: '桃園、南崁', km: 49, coordsN: '25.041314,121.295621', coordsS: '25.041314,121.295621'},
            {name: '機場系統交流道', cityN: '連接國道2號', cityS: '連接國道2號', km: 52, coordsN: '', coordsS: ''},
            {name: '中壢服務區'  ,cityN: '', cityS: '', km: 55, coordsN: '25.004089,121.252011', coordsS: '25.004089,121.252011'},
            {name: '內壢交流道', cityN: '大園、中壢', cityS: '中壢、大園', km: 57, coordsN: '24.985366,121.237915', coordsS: '24.985366,121.237915'},
            {name: '中壢轉接道', cityN: '連接五楊高架道路', cityS: '連接五楊高架道路', km: 59, coordsN: '', coordsS: ''},
            {name: '中壢交流道', cityN: '中壢、平鎮、新屋', cityS: '中壢、平鎮、新屋', km: 62, coordsN: '24.957158,121.197109', coordsS: '24.957158,121.197109'},
            {name: '平鎮系統交流道', cityN: '連接台66(觀音大溪)線快速公路', cityS: '連接台66(觀音大溪)線快速公路', km: 65, coordsN: '', coordsS: ''},
            {name: '幼獅交流道', cityN: '幼獅工業區', cityS: '幼獅工業區', km: 67, coordsN: '24.925741,121.170360', coordsS: '24.925741,121.170360'},
            {name: '楊梅交流道', cityN: '楊梅、埔心', cityS: '楊梅、埔心', km: 69, coordsN: '24.908881,121.166883', coordsS: '24.908881,121.166883'},
            {name: '高架道路楊梅端', cityN: '連接五楊高架道路', cityS: '連接五楊高架道路', km: 71, coordsN: '', coordsS: ''},
            {name: '湖口交流道', cityN: '湖口、新豐、新竹工業區', cityS: '湖口、新豐、新竹工業區', km: 83, coordsN: '24.871427,121.030932', coordsS: '24.871427,121.030932'},
            {name: '湖口服務區', cityN: '', cityS: '', km: 86, coordsN: '24.860823,121.012022', coordsS: '4.857659,121.009222'},
            {name: '竹北交流道'  ,cityN: '竹北、芎林', cityS: '竹北、芎林', km: 91, coordsN: '24.822476,121.019868', coordsS: '24.822476,121.019868'},
            {name: '新竹交流道', cityN: '新竹、竹東（A）科學工業園區（B）', cityS: '新竹、竹東（A）科學工業園區（B）', km: 95, coordsN: '24.788941,121.007591', coordsS: '24.788941,121.007591'},
            {name: '新竹系統交流道', cityN: '連接國道3號', cityS: '連接國道3號', km: 99, coordsN: '', coordsS: ''},
            {name: '頭份交流道', cityN: '頭份、三灣', cityS: '頭份、三灣', km: 110, coordsN: '24.689923,120.924203', coordsS: '24.689923,120.924203'},
            {name: '頭屋交流道', cityN: '造橋、頭屋', cityS: '造橋、頭屋', km: 125, coordsN: '24.579131,120.860024', coordsS: '24.579131,120.860024'},
            {name: '苗栗交流道', cityN: '苗栗、公館', cityS: '苗栗、公館', km: 132, coordsN: '24.520311,120.821583', coordsS: '24.520311,120.821583'},
            {name: '銅鑼交流道', cityN: '銅鑼,銅鑼科學園區', cityS: '銅鑼,銅鑼科學園區', km: 140, coordsN: '24.471718,120.781387', coordsS: '24.471718,120.781387'},
            {name: '三義交流道', cityN: '三義', cityS: '三義', km: 150, coordsN: '24.389956,120.758935', coordsS: '24.389956,120.758935'},
            {name: '泰安服務區', cityN: '', cityS: '', km: 159, coordsN: '24.328121,120.715883', coordsS: '24.329451,120.710883'},
            {name: '后里交流道', cityN: '后里、外埔', cityS: '后里、外埔', km: 160, coordsN: '24.315602,120.696970', coordsS: '24.315602,120.696970'},
            {name: '台中系統交流道', cityN: '連接國道4號', cityS: '連接國道4號', km: 165, coordsN: '', coordsS: ''},
            {name: '豐原交流道', cityN: '豐原、神岡', cityS: '豐原、神岡', km: 168, coordsN: '24.248518,120.697170', coordsS: '24.248518,120.697170'},
            {name: '大雅交流道', cityN: '台中、大雅', cityS: '台中、大雅', km: 174, coordsN: '24.202778,120.653859', coordsS: '24.202778,120.653859'},
            {name: '台中交流道', cityN: '台中、沙鹿', cityS: '台中、沙鹿', km: 178, coordsN: '24.172798,120.634112', coordsS: '24.172798,120.634112'},
            {name: '南屯交流道', cityN: '台中、龍井', cityS: '台中、龍井', km: 181, coordsN: '24.149064,120.624876', coordsS: '24.149064,120.624876'},
            {name: '王田交流道', cityN: '烏日、大肚', cityS: '烏日、大肚', km: 189, coordsN: '24.113487,120.589561', coordsS: '24.113487,120.589561'},
            {name: '彰化系統交流道', cityN: '連接國道3號', cityS: '連接國道3號', km: 192, coordsN: '', coordsS: ''},
            {name: '彰化交流道', cityN: '彰化、鹿港', cityS: '彰化、鹿港', km: 198, coordsN: '24.061689,120.519105', coordsS: '24.061689,120.519105'},
            {name: '埔鹽系統交流道', cityN: '連接台76(漢寶草屯)線快速公路', cityS: '連接台76(漢寶草屯)線快速公路', km: 207, coordsN: '', coordsS: ''},
            {name: '員林交流道', cityN: '埔心、員林、溪湖', cityS: '埔心、員林、溪湖', km: 211, coordsN: '23.952764,120.510941', coordsS: '23.952764,120.510941'},
            {name: '北斗交流道', cityN: '北斗、埤頭', cityS: '北斗、埤頭', km: 220, coordsN: '23.880222,120.497553', coordsS: '23.880222,120.497553'},
            {name: '西螺服務區', cityN: '', cityS: '', km: 229, coordsN: '23.788456,120.479242', coordsS: '23.788191,120.476914'},
            {name: '西螺交流道', cityN: '西螺、莿桐', cityS: '西螺、莿桐', km: 230, coordsN: '23.783440,120.474298', coordsS: '23.783440,120.474298'},
            {name: '虎尾交流道', cityN: '虎尾、斗六', cityS: '斗六、虎尾', km: 235, coordsN: '23.735796,120.478383', coordsS: '23.735796,120.478383'},
            {name: '斗南交流道', cityN: '斗南、斗六、虎尾', cityS: '斗南、虎尾', km: 240, coordsN: '23.694955,120.463101', coordsS: '23.694955,120.463101'},
            {name: '雲林系統交流道', cityN: '連接台78(台西古坑)線快速公路', cityS: '連接台78(台西古坑)線快速公路', km: 243, coordsN: '', coordsS: ''},
            {name: '大林交流道', cityN: '溪口、大林', cityS: '大林、溪口', km: 250, coordsN: '23.611458,120.440344', coordsS: '23.611458,120.440344'},
            {name: '民雄交流道', cityN: '新港、民雄', cityS: '民雄、新港', km: 257, coordsN: '23.551517,120.419088', coordsS: '23.551517,120.419088'},
            {name: '嘉義交流道', cityN: '嘉義、北港、新港', cityS: '嘉義、北港、新港', km: 264, coordsN: '23.492255,120.396766', coordsS: '23.492255,120.396766'},
            {name: '水上交流道', cityN: '朴子、太保、水上', cityS: '水上、朴子、太保', km: 270, coordsN: '23.443703,120.370074', coordsS: '23.443703,120.370074'},
            {name: '嘉義系統交流道', cityN: '連接台82(東石嘉義)線快速公路', cityS: '連接台82(東石嘉義)線快速公路', km: 272, coordsN: '', coordsS: ''},
            {name: '新營服務區', cityN: '', cityS: '', km: 284, coordsN: '23.339221,120.313032', coordsS: '23.340245,120.310951'},
            {name: '新營交流道', cityN: '鹽水、新營', cityS: '新營、鹽水', km: 288, coordsN: '23.306215,120.294605', coordsS: '23.306215,120.294605'},
            {name: '下營系統交流道', cityN: '連接台84(北門玉井)線快速公路', cityS: '連接台84(北門玉井)線快速公路', km: 299, coordsN: '', coordsS: ''},
            {name: '麻豆交流道', cityN: '麻豆、佳里', cityS: '佳里、麻豆', km: 303, coordsN: '23.184579,120.240020', coordsS: '23.184579,120.240020'},
            {name: '安定交流道', cityN: '安定、善化', cityS: '善化、安定', km: 311, coordsN: '23.119177,120.246264', coordsS: '23.119177,120.246264'},
            {name: '台南系統交流道', cityN: '連接國道8號', cityS: '連接國道8號', km: 315, coordsN: '', coordsS: ''},
            {name: '永康交流道', cityN: '台南、永康', cityS: '永康、台南', km: 319, coordsN: '23.041892,120.247498', coordsS: '23.041892,120.247498'},
            {name: '大灣交流道', cityN: '台南、仁德', cityS: '台南、仁德', km: 324, coordsN: '22.998637,120.247536', coordsS: '22.998637,120.247536'},
            {name: '台南(仁德)交流道', cityN: '台南、仁德', cityS: '仁德、台南', km: 327, coordsN: '22.972959,120.246709', coordsS: '22.972959,120.246709'},
            {name: '仁德系統交流道', cityN: '連接台86(台南關廟)線快速公路', cityS: '連接台86(台南關廟)線快速公路', km: 330, coordsN: '', coordsS: ''},
            {name: '仁德服務區', cityN: '', cityS: '', km: 335, coordsN: '22.906372,120.266047', coordsS: '22.905567,120.265138'},
            {name: '路竹交流道', cityN: '路竹、阿蓮', cityS: '阿蓮、路竹', km: 338, coordsN: '22.879774,120.275640', coordsS: '22.879774,120.275640'},
            {name: '高科交流道', cityN: '高雄科學園區', cityS: '高雄科學園區', km: 342, coordsN: '22.844186,120.289313', coordsS: '22.844186,120.289313'},
            {name: '岡山交流道', cityN: '岡山、燕巢', cityS: '燕巢、岡山', km: 349, coordsN: '22.787098,120.318168', coordsS: '22.787098,120.318168'},
            {name: '楠梓交流道', cityN: '楠梓、仁武', cityS: '大社、楠梓', km: 356, coordsN: '22.739615,120.336599', coordsS: '22.739615,120.336599'},
            {name: '鼎金系統交流道', cityN: '連接國道10號', cityS: '連接國道10號', km: 362, coordsN: '', coordsS: ''},
            {name: '高雄交流道', cityN: '中正路（B）三多路（C）', cityS: '九如路（A）建國路（A）中正路（B）', km: 367, coordsN: '22.630882,120.335279', coordsS: '22.630882,120.335279'},
            {name: '瑞隆路出口匝道', cityN: '------', cityS: '瑞隆路', km: 369, coordsN: '', coordsS: '22.606190,120.340322'},
            {name: '五甲系統交流道', cityN: '連接台88(高雄潮州)線快速公路', cityS: '連接台88(高雄潮州)線快速公路', km: 370, coordsN: '', coordsS: ''},
            {name: '五甲交流道', cityN: '鳳山', cityS: '------', km: 371, coordsN: '22.583077,120.332903', coordsS: ''},
            {name: '高雄端', cityN: '------', cityS: '機場、市區', km: 372, coordsN: '', coordsS: '22.583126,120.337000'},
            {name: '高雄端', cityN: '------', cityS: '漁港路、旗津、第三~五貨櫃區', km: 373, coordsN: '', coordsS: '22.580210,120.319697'},
            {name: '高雄端', cityN: '------', cityS: '第一、二貨櫃區', km: 374, coordsN: '', coordsS: '22.581171,120.311886'}
          ]
        },
        {
          name: "汐止－楊梅高架",
          detail:
          [
            {name: '汐止端', cityN: '連接國道1號主線', cityS: '連接國道1號主線', km: 13, coordsN: '', coordsS: ''},
            {name: '堤頂交流道', cityN: '堤頂大道', cityS: '堤頂大道', km: 18, coordsN: '25.074627,121.572502', coordsS: '25.074627,121.572502'},
            {name: '下塔悠出口匝道', cityN: '濱江街', cityS: '------', km: 20, coordsN: '25.070834,121.561417', coordsS: ''},
            {name: '環北交流道', cityN: '環河北路', cityS: '------', km: 25, coordsN: '25.074156,121.508848', coordsS: ''},
            {name: '五股轉接道', cityN: '連接國道1號主線', cityS: '連接國道1號主線', km: 32, coordsN: '', coordsS: ''},
            {name: '泰山轉接道', cityN: '連接國道1號主線', cityS: '連接國道1號主線', km: 35, coordsN: '', coordsS: ''},
            {name: '機場系統交流道', cityN: '連接國道2號主線', cityS: '連接國道2號主線', km: 52, coordsN: '', coordsS: ''},
            {name: '中壢轉接道', cityN: '連接國道1號主線', cityS: '連接國道1號主線', km: 59, coordsN: '', coordsS: ''},
            {name: '校前路交流道', cityN: '楊梅、龍潭', cityS: '------', km: 70, coordsN: '24.900895,121.150614', coordsS: ''},
            {name: '楊梅端', cityN: '連接國道1號主線', cityS: '連接國道1號主線', km: 71, coordsN: '', coordsS: ''}
          ]
        },
        {
          name: "國二",
          detail:
          [
            {name: '機場端(西)', cityN: '------', cityS: '------', km: 0, coordsN: '25.074938,121.231073', coordsS: '25.074938,121.231073'},
            {name: '大園交流道', cityN: '大園、埔心', cityS: '大園、埔心', km: 1, coordsN: '25.056230,121.217711', coordsS: '25.056230,121.217711'},
            {name: '大竹交流道', cityN: '青埔、蘆竹', cityS: '蘆竹、青埔', km: 4, coordsN: '25.038122,121.241052', coordsS: '25.038122,121.241052'},
            {name: '機場系統交流道', cityN: '連接國道1號', cityS: '連接國道1號', km: 8, coordsN: '', coordsS: ''},
            {name: '南桃園交流道', cityN: '桃園', cityS: '桃園', km: 11, coordsN: '25.002394,121.287184', coordsS: '25.002394,121.287184'},
            {name: '大湳交流道', cityN: '八德、鶯歌', cityS: '八德、鶯歌', km: 18, coordsN: '24.960479,121.322095', coordsS: '24.960479,121.322095'},
            {name: '鶯歌系統交流道(東)', cityN: '連接國道3號', cityS: '連接國道3號', km: 20, coordsN: '', coordsS: ''}
          ]
        },
        {
          name: "國三",
          detail:
          [
            {name: '基金交流道', cityN: '基隆、萬里', cityS: ' ------', km: 0, coordsN: '25.140299,121.713530', coordsS: ''},
            {name: '瑪東系統交流道', cityN: '連接台62(萬里瑞濱)線快速公路 ', cityS: '連接台62(萬里瑞濱)線快速公路', km: 2, coordsN: '', coordsS: ''},
            {name: '汐止系統交流道', cityN: '連接國道1號 ', cityS: '連接國道1號', km: 10, coordsN: '', coordsS: ''},
            {name: '新台五路交流道', cityN: '汐止、南港', cityS: '汐止、南港', km: 12, coordsN: '25.057036,121.633370', coordsS: '25.057036,121.633370'},
            {name: '南港交流道', cityN: '南港', cityS: '南港', km: 14, coordsN: '25.047612,121.624773', coordsS: '25.047612,121.624773'},
            {name: '南港系統交流道', cityN: '連接國道5號', cityS: '連接國道5號', km: 16, coordsN: '', coordsS: ''},
            {name: '南深路出口匝道', cityN: '中央研究院', cityS: ' ------', km: 16, coordsN: '25.039141,121.621595', coordsS: ''},
            {name: '木柵交流道', cityN: '連接國道3甲 ', cityS: '連接國道3甲', km: 20, coordsN: '', coordsS: ''},
            {name: '木柵休息站', cityN: '', cityS: '', km: 25, coordsN: '24.975943,121.570480', coordsS: ''},
            {name: '新店交流道', cityN: '新店', cityS: '新店', km: 26, coordsN: '24.971852,121.547652', coordsS: '24.971852,121.547652'},
            {name: '安坑交流道', cityN: '安坑、新店、台北 ', cityS: '安坑、新店', km: 31, coordsN: '24.963823,121.520320', coordsS: '24.963823,121.520320'},
            {name: '中和交流道', cityN: '中和、板橋', cityS: '中和、板橋', km: 35, coordsN: '24.994503,121.485940', coordsS: '24.994503,121.485940'},
            {name: '土城交流道', cityN: '土城、板橋 ', cityS: '土城、板橋', km: 42, coordsN: '24.965582,121.434184', coordsS: '24.965582,121.434184'},
            {name: '樹林交流道', cityN: '------ ', cityS: '樹林、三峽', km: 47, coordsN: '', coordsS: '24.952932,121.387741'},
            {name: '三鶯交流道', cityN: '鶯歌,三峽（A）三峽（B）', cityS: '鶯歌（A）三峽（B）', km: 50, coordsN: '24.938728,121.363703', coordsS: '24.938728,121.363703'},
            {name: '鶯歌系統交流道', cityN: '連接國道2號', cityS: '連接國道2號', km: 54, coordsN: '', coordsS: ''},
            {name: '大溪交流道', cityN: '慈湖、大溪、中壢、平鎮 ', cityS: '慈湖、大溪、中壢、平鎮', km: 62, coordsN: '24.889877,121.270869', coordsS: '24.889877,121.270869'},
            {name: '龍潭交流道', cityN: '龍潭', cityS: '龍潭 ', km: 68, coordsN: '24.857549,121.219163', coordsS: '24.857549,121.219163'},
            {name: '關西服務區', cityN: '', cityS: '', km: 76, coordsN: '24.800939,121.192926', coordsS: '24.800939,121.192926'},
            {name: '關西交流道', cityN: '關西、新埔', cityS: '關西、新埔', km: 79, coordsN: '24.798523,121.169388', coordsS: '24.798523,121.169388'},
            {name: '竹林交流道', cityN: '竹東、芎林 ', cityS: '竹東、芎林', km: 90, coordsN: '24.763605,121.087057', coordsS: '24.763605,121.087057'},
            {name: '寶山休息站', cityN: '', cityS: '', km: 96, coordsN: '', coordsS: '24.755621,121.025256'},
            {name: '寶山交流道', cityN: '寶山、科學工業園區 ', cityS: '寶山、科學工業園區', km: 98, coordsN: '24.756211,121.006064', coordsS: '24.756211,121.006064'},
            {name: '新竹系統交流道', cityN: '連接國道1號', cityS: '連接國道1號', km: 100, coordsN: '', coordsS: ''},
            {name: '茄苳交流道', cityN: '新竹 ', cityS: '新竹', km: 103, coordsN: '24.760148,120.958597', coordsS: '24.760148,120.958597'},
            {name: '香山交流道', cityN: '香山、竹南', cityS: '香山、頭份', km: 109, coordsN: '24.734102,120.913099', coordsS: '24.734102,120.913099'},
            {name: '西濱交流道', cityN: '------ ', cityS: '台61 快速公路', km: 115, coordsN: '', coordsS: '24.701489,120.865839'},
            {name: '竹南交流道', cityN: '竹南', cityS: '竹南', km: 119, coordsN: '24.676238,120.846060', coordsS: '24.676238,120.846060'},
            {name: '大山交流道', cityN: '造橋、大山', cityS: '造橋、大山', km: 124, coordsN: '24.635900,120.818981', coordsS: '24.635900,120.818981'},
            {name: '後龍交流道', cityN: '苗栗、後龍 ', cityS: '苗栗、後龍', km: 130, coordsN: '24.596736,120.787645', coordsS: '24.596736,120.787645'},
            {name: '西湖服務區', cityN: '', cityS: '', km: 134, coordsN: '24.565427,120.761124', coordsS: '24.565618,120.759130'},
            {name: '通霄交流道', cityN: '銅鑼、通霄 ', cityS: '銅鑼、通霄 ', km: 144, coordsN: '24.496571,120.703036', coordsS: '24.496571,120.703036'},
            {name: '苑裡交流道', cityN: '三義、苑裡', cityS: '三義、苑裡', km: 156, coordsN: '24.393011,120.672667', coordsS: '24.393011,120.672667'},
            {name: '大甲交流道', cityN: '外埔、大甲 ', cityS: '外埔、大甲', km: 164, coordsN: '24.332002,120.645153', coordsS: '24.332002,120.645153'},
            {name: '中港系統交流道', cityN: '連接國道4號', cityS: '連接國道4號', km: 169, coordsN: '', coordsS: ''},
            {name: '清水服務區', cityN: '', cityS: '', km: 172, coordsN: '24.280843,120.601613', coordsS: '24.280843,120.601613'},
            {name: '沙鹿交流道', cityN: '大雅、沙鹿', cityS: '大雅、沙鹿', km: 176, coordsN: '24.249966,120.595785', coordsS: '24.249966,120.595785'},
            {name: '龍井交流道', cityN: '台中、龍井', cityS: '台中、龍井', km: 182, coordsN: '24.201676,120.569419', coordsS: '24.201676,120.569419'},
            {name: '和美交流道', cityN: '和美、伸港 ', cityS: '和美、伸港', km: 191, coordsN: '24.148727,120.516413', coordsS: '24.148727,120.516413'},
            {name: '彰化系統交流道', cityN: '連接國道1號 ', cityS: '連接國道1號', km: 196, coordsN: '', coordsS: ''},
            {name: '快官交流道', cityN: '台中、彰化 ', cityS: '台中、彰化', km: 202, coordsN: '24.090297,120.601622', coordsS: '24.090297,120.601622'},
            {name: '烏日交流道', cityN: '烏日', cityS: '烏日', km: 207, coordsN: '24.065417,120.646204', coordsS: '24.065417,120.646204'},
            {name: '中投交流道', cityN: '台中、大里', cityS: '大里', km: 209, coordsN: '24.062784,120.662874', coordsS: '24.062784,120.662874'},
            {name: '霧峰交流道', cityN: '霧峰、太平 ', cityS: '霧峰、太平', km: 211, coordsN: '24.051847,120.694872', coordsS: '24.051847,120.694872'},
            {name: '霧峰系統交流道', cityN: '連接國道6號', cityS: '連接國道6號 ', km: 214, coordsN: '', coordsS: ''},
            {name: '草屯交流道', cityN: '(A)芬園 (B)草屯 ', cityS: '草屯、芬園', km: 217, coordsN: '24.002995,120.655270', coordsS: '24.002995,120.655270'},
            {name: '中興系統交流道', cityN: '連接台76(漢寶草屯)線快速公路', cityS: '連接台76(漢寶草屯)線快速公路', km: 222, coordsN: '', coordsS: ''},
            {name: '中興交流道', cityN: '南投、中興新村', cityS: '南投、中興新村 ', km: 224, coordsN: '23.952491,120.662815', coordsS: '23.952491,120.662815'},
            {name: '南投交流道', cityN: '南投、中寮', cityS: '南投、中寮', km: 228, coordsN: '23.918738,120.686795', coordsS: '23.918738,120.686795'},
            {name: '南投服務區', cityN: '', cityS: '', km: 231, coordsN: '23.899332,120.710523', coordsS: '23.899332,120.710523'},
            {name: '名間交流道', cityN: '名間、集集', cityS: '名間、集集 ', km: 237, coordsN: '23.849684,120.696634', coordsS: '23.849684,120.696634'},
            {name: '竹山交流道', cityN: '竹山、鹿谷', cityS: '竹山、鹿谷', km: 243, coordsN: '23.794437,120.710287', coordsS: '23.794437,120.710287'},
            {name: '南雲交流道', cityN: '竹山、林內', cityS: '竹山、林內', km: 250, coordsN: '23.771999,120.659269', coordsS: '23.771999,120.659269'},
            {name: '斗六交流道', cityN: '斗六、林內 ', cityS: '斗六、林內', km: 260, coordsN: '23.731723,120.594030', coordsS: '23.731723,120.594030'},
            {name: '古坑系統交流道', cityN: '連接台78(台西古坑)線快速公路', cityS: '連接台78(台西古坑)線快速公路', km: 269, coordsN: '', coordsS: ''},
            {name: '古坑交流道', cityN: '古坑', cityS: '台西、古坑', km: 271, coordsN: '23.646467,120.573804', coordsS: '23.646467,120.573804'},
            {name: '古坑服務區', cityN: '', cityS: '', km: 276, coordsN: '23.608435,120.545278', coordsS: '23.608435,120.545278'},
            {name: '梅山交流道', cityN: '梅山、大林', cityS: '梅山、大林', km: 279, coordsN: '23.594455,120.525586', coordsS: '23.594455,120.525586'},
            {name: '竹崎交流道', cityN: '竹崎、民雄、嘉義 ', cityS: '竹崎、民雄、嘉義', km: 290, coordsN: '23.520233,120.484017', coordsS: '23.520233,120.484017'},
            {name: '中埔交流道', cityN: '中埔、嘉義', cityS: '中埔、嘉義', km: 297, coordsN: '23.449739,120.488942', coordsS: '23.449739,120.488942'},
            {name: '水上系統交流道', cityN: '連接台82(東石嘉義)線快速公路', cityS: '連接台82(東石嘉義)線快速公路', km: 300, coordsN: '', coordsS: ''},
            {name: '白河交流道', cityN: '東山、白河 ', cityS: '東山、白河', km: 311, coordsN: '23.347227,120.436895', coordsS: '23.347227,120.436895'},
            {name: '東山服務區', cityN: '', cityS: '', km: 319, coordsN: '23.287080,120.398775', coordsS: '23.287080,120.398775'},
            {name: '柳營交流道', cityN: '東山、柳營', cityS: '東山、柳營', km: 322, coordsN: '23.268077,120.380313', coordsS: '23.268077,120.380313'},
            {name: '烏山頭交流道', cityN: '官田、六甲 ', cityS: '官田、六甲', km: 329, coordsN: '23.212543,120.358103', coordsS: '23.212543,120.358103'},
            {name: '官田系統交流道', cityN: '連接台84(北門玉井)線快速公路 ', cityS: '連接台84(北門玉井)線快速公路', km: 334, coordsN: '', coordsS: ''},
            {name: '善化交流道', cityN: '善化、山上 ', cityS: '善化、山上', km: 340, coordsN: '23.123024,120.333950', coordsS: '23.123024,120.333950'},
            {name: '新化系統交流道', cityN: '連接國道8號 ', cityS: '連接國道8號', km: 346, coordsN: '', coordsS: ''},
            {name: '新化休息站', cityN: '', cityS: '', km: 350, coordsN: '23.030608,120.327811', coordsS: '23.031358,120.327189'},
            {name: '關廟交流道', cityN: '關廟、歸仁、台南', cityS: '關廟、歸仁、台南', km: 357, coordsN: '22.974587,120.319690', coordsS: '22.974587,120.319690'},
            {name: '關廟服務區', cityN: '', cityS: '', km: 363, coordsN: '22.928958,120.352122', coordsS: '22.929423,120.350856'},
            {name: '田寮交流道', cityN: '田寮、阿蓮', cityS: '田寮、阿蓮', km: 369, coordsN: '22.879726,120.363377', coordsS: '22.879726,120.363377'},
            {name: '燕巢系統交流道', cityN: '連接國道10號', cityS: '連接國道10號', km: 383, coordsN: '', coordsS: ''},
            {name: '九如交流道', cityN: '里港、九如 ', cityS: '里港、屏東', km: 391, coordsN: '22.750057,120.491127', coordsS: '22.750057,120.491127'},
            {name: '長治交流道', cityN: '長治、三地門 ', cityS: '長治、三地門', km: 400, coordsN: '22.694232,120.560003', coordsS: '22.694232,120.560003'},
            {name: '麟洛交流道', cityN: '屏東、內埔', cityS: '麟洛、內埔', km: 407, coordsN: '22.647278,120.544394', coordsS: '22.647278,120.544394'},
            {name: '竹田系統交流道', cityN: '連接台88(高雄潮州)線快速公路', cityS: '連接台88(高雄潮州)線快速公路', km: 415, coordsN: '', coordsS: ''},
            {name: '崁頂交流道', cityN: ' --', cityS: '崁頂', km: 421, coordsN: '', coordsS: '22.513213,120.524221'},
            {name: '南州交流道', cityN: '新埤、南州 ', cityS: '新埤、南州', km: 424, coordsN: '22.491467,120.537142', coordsS: '22.491467,120.537142'},
            {name: '林邊交流道', cityN: '-- ', cityS: '林邊、東港', km: 430, coordsN: '', coordsS: '22.443907,120.507118'},
            {name: '大鵬灣端', cityN: ' --', cityS: '大鵬灣', km: 431, coordsN: '', coordsS: '22.441834,120.493031'}
          ]
        },
        {
          name: "國三甲",
          detail:
          [
            {name: '台北端(西)', cityN: '辛亥路', cityS: '------', km: 0 , coordsN: '25.017802,121.548134', coordsS: ''},
            {name: '萬芳交流道', cityN: '木柵路', cityS: '木柵路', km: 3, coordsN: '24.999972,121.575866', coordsS: '24.999972,121.575866'},
            {name: '木柵交流道', cityN: '新店（A）汐止（B）', cityS: '新店（A）汐止（B）', km: 5, coordsN: '25.000442,121.596278', coordsS: '25.000442,121.596278'},
            {name: '深坑端(東)', cityN: '-------', cityS: '深坑', km: 6, coordsN: '', coordsS: '24.998953,121.608460'}
          ]
        },
        {
          name: "國四",
          detail:
          [
            {name: '清水端(西)', cityN: '清水、台中港', cityS: '------', km: 0, coordsN: '24.304630,120.591833', coordsS: ''},
            {name: '中港系統交流道', cityN: '連接國道3號', cityS: '連接國道3號', km: 2, coordsN: '', coordsS: ''},
            {name: '神岡交流道', cityN: '神岡', cityS: '神岡', km: 9, coordsN: '24.273756,120.664937', coordsS: '24.273756,120.664937'},
            {name: '台中系統交流道', cityN: '連接國道1號', cityS: '連接國道1號', km: 11, coordsN: '', coordsS: ''},
            {name: '后豐交流道', cityN: '-------', cityS: '后里、豐原', km: 14, coordsN: '', coordsS: '24.276728,120.722206'},
            {name: '豐原端(東)', cityN: '-------', cityS: '豐原、石岡、東勢', km: 17, coordsN: '', coordsS: '24.267803,120.748983'}
          ]
        },
        {
          name: "國五",
          detail:
          [
            {name: '南港系統交流道(北)', cityN: '連接國道3號', cityS: '連接國道3號', km: 0, coordsN: '', coordsS: ''},
            {name: '石碇交流道', cityN: '石碇、深坑', cityS: '石碇、深坑', km: 4, coordsN: '25.009236,121.645265', coordsS: '25.009236,121.645265'},
            {name: '石碇服務區', cityN: '', cityS: '', km: 4.1, coordsN: '', coordsS: '25.009236,121.645265'},
            {name: '坪林行控中心專用道', cityN: '坪林', cityS: '坪林', km: 14, coordsN: '24.942791,121.713177', coordsS: '24.942791,121.713177'},
            {name: '頭城交流道', cityN: '頭城、礁溪', cityS: '頭城、礁溪', km: 30, coordsN: '24.838447,121.791506', coordsS: '24.838447,121.791506'},
            {name: '宜蘭交流道', cityN: '壯圍、宜蘭', cityS: '壯圍、宜蘭', km: 38, coordsN: '24.773512,121.780308', coordsS: '24.773512,121.780308'},
            {name: '羅東交流道', cityN: '羅東、五結', cityS: '羅東、五結', km: 47, coordsN: '24.699498,121.792107', coordsS: '24.699498,121.792107'},
            {name: '蘇澳交流道(南)', cityN: '------', cityS: '蘇澳、冬山', km: 54, coordsN: '', coordsS: '24.616754,121.826791'}
          ]
        },
        {
          name: "國六",
          detail:
          [
            {name: '霧峰系統交流道(西)', cityN: '連接國道3號', cityS: '連接國道3號', km: 0, coordsN: '', coordsS: ''},
            {name: '舊正交流道', cityN: '霧峰、草屯', cityS: '霧峰、草屯', km: 3, coordsN: '24.014350,120.690072', coordsS: '24.013271,120.695821'},
            {name: '東草屯交流道', cityN: '草屯', cityS: '草屯', km:  5, coordsN: '24.002470,120.720555', coordsS: '24.002470,120.720555'},
            {name: '國姓交流道', cityN: '國姓', cityS: '國姓', km: 17, coordsN: '24.013491,120.819402', coordsS: '24.013491,120.819402'},
            {name: '北山交流道', cityN: '----', cityS: '北山', km: 25, coordsN: '', coordsS: '3.983231,120.883127'},
            {name: '愛蘭交流道', cityN: '埔里、魚池', cityS: '埔里、魚池', km: 29, coordsN: '23.972901,120.926254', coordsS: '23.972901,120.926254'},
            {name: '埔里交流道', cityN: '----', cityS: '國姓、埔里', km: 34, coordsN: '', coordsS: '23.986763,120.973413'},
            {name: '埔里端(東)', cityN: '----', cityS: '埔里、霧社', km: 37, coordsN: '', coordsS: '23.978808,120.993607'}
          ]
        },
        {
          name: "國八",
          detail:
          [
            {name: '台南端(西)', cityN: '台南市區', cityS: '------', km: 0, coordsN: '23.080309,120.195134', coordsS: ''},
            {name: '新吉交流道 ', cityN: '安南、西港', cityS: '------', km: 2, coordsN: '23.091227,120.209975', coordsS: ''},
            {name: '台南系統交流道', cityN: '連接國道1號', cityS: '連接國道1號', km: 6, coordsN: '', coordsS: ''},
            {name: '新市交流道', cityN: '新市、永康、台南科學園區', cityS: '永康、新市、台南科學園區', km: 9, coordsN: '23.068442,120.279877', coordsS: '23.068442,120.279877'},
            {name: '新化系統交流道', cityN: '連接國道3號', cityS: '連接國道3號', km: 14, coordsN: '', coordsS: ''},
            {name: '新化端(東)', cityN: '-------', cityS: '新化、山上、左鎮', km: 15, coordsN: '', coordsS: '23.061994,120.333030'}
          ]
        },
        {
          name: "國十",
          detail:
          [
            {name: '左營端(西)', cityN: '自由路、博愛路', cityS: '------', km: 0, coordsN: '22.683947,120.304482', coordsS: ''},
            {name: '鼎金系統交流道', cityN: '連接國道1號', cityS: '連接國道1號', km: 1, coordsN: '', coordsS: ''},
            {name: '仁武交流道', cityN: '仁武、大樹', cityS: '仁武、大樹', km: 6, coordsN: '22.703353,120.361395', coordsS: '22.703353,120.361395'},
            {name: '燕巢交流道', cityN: '燕巢', cityS: '燕巢', km: 13, coordsN: '22.757832,120.369241', coordsS: '22.757832,120.369241'},
            {name: '燕巢系統交流道', cityN: '連接國道3號', cityS: '連接國道3號', km: 19, coordsN: '', coordsS: ''},
            {name: '嶺口交流道', cityN: '------', cityS: '大樹、旗山', km: 22, coordsN: '', coordsS: '22.796755,120.458068'},
            {name: '里港交流道', cityN: '------', cityS: '里港', km: 25, coordsN: '', coordsS: '22.799841,120.481693'},
            {name: '旗山端(東)', cityN: '------', cityS: '旗山、美濃、里港', km: 33, coordsN: '', coordsS: '22.868624,120.496159 '}
          ]
        }
      ]

    DATA.each do |freeway|
      f = Freeway.create(name: freeway[:name])
      freeway[:detail].each do |interchange|
        f.interchanges.create(
          name: interchange[:name],
          cityNW: interchange[:cityN],
          citySE: interchange[:cityS],
          km: interchange[:km],
          coordsNW: interchange[:coordsN],
          coordsSE: interchange[:coordsS]
        )
      end
    end
  end
end