namespace :db do
  desc "TODO"
  task make_data: [:create_users, :create_tags, :create_posts, :create_post_tags,:create_replies] do
  end
  task create_users: :environment do
    User.create!(
      name: "Anonymous User",
      email: "user12211332244564324632@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      avatar: File.open(File.join(Rails.root,"app/assets/images/anonymous_user.jpg"))
    )

    User.create!(
      name: "Vo Van Danh",
      email: "danh13t1@gmail.com",
      password: "123456",
      password_confirmation: "123456"
    )

    User.create!(
      name: "Nguyen Phan Hoang Linh",
      email: "nguyen.phan.hoang.linh@framgia.com",
      password: "123123",
      password_confirmation: "123123"
    )

    User.create!(
      name: "Tran Duc Quoc",
      email: "tran.duc.quoc@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123"
    )

    User.create!(
      name: "Hoang Nhac Trung",
      email: "hoang.nhac.trung@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123"
    )

    User.create!(
      name: "Pham Thanh Luan",
      email: "pham.thanh.luan@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123"
    )

    User.create!(
      name: "Le Thi Hong Thuy",
      email: "le.thi.hong.thuy@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123"
    )

    User.create!(
      name: "Nguyen Thi Minh Ngoc",
      email: "nguyen.thi.minh.ngoc@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123"
    )

    User.create!(
      name: "Nguyen Thi Uoc Mo",
      email: "nguyen.thi.uoc.mo@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123"
    )

    User.create!(
      name: "Tran Thi Kim Ngan",
      email: "tran.thi.kim.ngan@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123"
    )
  end

  task create_posts: :environment do
    Post.create!(
      title: "Return Result To Ajax/Js/Jquery",
      user_id: 2,
      type: 1,
      content: "<p>Cho m&igrave;nh hỏi code n&agrave;y</p>\r\n\r\n<pre class=\"hljs brush: javascript;
        syntaxhighlight\">\r\ndata: function() {\r\n  var newData = this.data,\r\n    oldData =
        this.oldData;\r\n\r\n  if ( newData.code ){\r\n    this.parts.pre.setHtml( CKEDITOR.tools.
        htmlEncode( newData.code ) );\r\n    this.parts.pre.addClass( &#39;brush:&#39; );\r\n
        if([&quot;xml&quot;, &quot;html&quot;, &quot;xhtml&quot;, null].includes(newData.lang))\r\n
        var lang = &#39;php&#39;\r\n    else\r\n      var lang = newData.lang\r\n    this.parts.pre.
        addClass( lang + &#39;;&#39; );\r\n    this.parts.pre.addClass( &#39;syntaxhighlight&#39; );
        \r\n  }\r\n    // this.highlight();\r\n  this.oldData = CKEDITOR.tools.copy( newData );\r\n}
        </pre>\r\n\r\n<p>bị sai chỗ n&agrave;o vậy ạ</p>\r\n\r\n<p>Thank&nbsp;<img alt=\"heart\"
        height=\"23\" src=\"http://localhost:3000/assets/ckeditor/plugins/smiley/images/heart.png\"
        title=\"heart\" width=\"23\" /></p>\r\n"
    )

    Post.create!(
      title: "Góp ý vê hệ thống Redmine",
      user_id: 2,
      type: 0,
      content: "Hiện nay hệ thống redmine chỉ lưu 1 người được assign gây khó khăn cho người quản lý.
      Ví dụ: sau khi dev hoàn thành ticket, sẽ gán lại cho reviewer và bị mất người dev ban đầu (chỉ lưu trong history).
      khi reviewer muốn comment lại assign cho dev thì phải tìm trong history để gán lại.
      Cách làm này tạm thời cũng vẫn chạy, nhưng tôi biết là redmine có thể cấu hình lại để thêm vào các position cho rõ ràng,
      ví dụ: các vai trò: developer, reviewer của một ticket nên được lưu tách biệt để dễ dàng quản lý và theo dõi.
      (Tại mỗi thời điểm thì tất nhiên chỉ có một assignee). Công ty có thể cấu hình lại redmine cho rõ ràng các role để tiện lợi hơn không?"
    )

    Post.create!(
      title: "Góp ý Nhà vệ sinh/Toilet",
      user_id: 1,
      type: 0,
      content: "Mình có thể yêu cầu tòa nhà cho vài cái biển báo hỏng treo trước của phòng toilet được không?
      Để người nào đi VS xong nếu cầu hỏng còn biết để thông báo cho người khác với.
      Em vừa gặp trường hợp mở nắp VS và thấy ..... nhìn tởm. em cảm ơn."
    )

    Post.create!(
      title: "Góp ý khăn lau bàn làm việc",
      user_id: 1,
      type: 0,
      content: "Các cô lau bàn làm việc bằng khăn quá cũ hay sao ấy, lông của khăn lau dính lại rất nhiều trên bàn làm việc,
      nhìn bẩn kinh khủng ấy, nhiều khi mình k để ý để tay lên còn bị ngứa mẩn đỏ cả 2 tay, rất khó chịu.
      Cá nhân mình nghĩ thà không lau còn hơn, lau lại thấy bẩn hơn.
      Mình góp ý công ty nên thay khăn lau mới cho các cô lao công ạ, hoặc là không lau nữa (haiz)"
    )

    Post.create!(
      title: "Góp ý Cốc uống nước",
      user_id: 1,
      type: 0,
      content: "Công ty mình có thể thay cốc nhựa bằng cốc giấy để bảo vệ môi trường vs sức khỏe đc ko?"
    )

    Post.create!(
      title: "Góp ý Nhà vệ sinh nam",
      user_id: 1,
      type: 0,
      content: "Có rất nhiều người ý kiến nhưng dường như k đc để ý đến. Nhà vệ sinh nam xuống cấp.
      Vòi nước rửa tay quá ngắn gây khó khăn cho việc rửa tay. Nhà vệ sinh cũng không có mùi thơm nữa kể cả buổi sáng.
      Rất bực mình mỗi lần đi vệ sinh. Mong công ty để ý đến góp ý của nhân viên. Đừng làm ngơ nữa"
    )

    Post.create!(
      title: "Góp ý âm lượng quá to khu xanh tím",
      user_id: 1,
      type: 0,
      content: "Là công ty IT nên việc trong giờ làm các thành viên trong dự án trao đổi với nhau là điều dễ hiểu.
      Tuy nhiên, mình thấy một vài cá nhân thường xuyên trao đổi với nhau với âm lượng quá to mà không ý thức được rằng đang làm ảnh hưởng đến những người ngồi gần,
      khiến mọi người không thể tập trung làm việc được.
      Mình không rõ team nào nhưng có một vài bạn nam ở dãy bàn thứ 2, 3 bên trái (nhìn từ free space) thuộc khu xanh tím thường xuyên nói rất to.
      Nếu có thể rất mong các bạn giảm bớt âm lượng để những người xung quanh  có thể tập trung hơn vào công việc."
    )

    Post.create!(
      title: "Góp ý về ý thức",
      user_id: 1,
      type: 0,
      content: "Bạn N div 3 (Đà Nẵng) có thể sử dụng đồ chung của công ty 1 cách có ý thức không vậy?
      Không phải mình thấy 1 lần mà nhiều lần rồi, lấy nước mà hết cũng không thay bình mới là sao vậy bạn?"
    )

    Post.create!(
      title: "Góp ý việc quote ChatWork",
      user_id: 1,
      type: 0,
      content: "Có thể quote những tin nhắn không liên quan mà bỏ đi phần list người được TO được không?
      Nhiều khi những tin nhắn TO all nhưng không liên quan cứ đi quote lại."
    )

    Post.create!(
      title: "Góp ý dùng từ cho vị trí kỹ sư cầu nối",
      user_id: 1,
      type: 0,
      content: "Về vị trí kỹ sư cầu nối, cty dùng cả BSE và BrSE.
      BSE cũng là từ viết tắt của chứng bệnh bò điên (Bovine Spongiform Encephalopathy (mad cow disease) nên cty nên xem xét chỉ dùng từ khóa BrSE với vị trí là kỹ sư cầu nối."
    )

    Post.create!(
      title: "Góp ý giới thiệu về bản thân",
      user_id: 1,
      type: 0,
      content: "Với các email giới thiệu về bản thân nên yêu cầu nhân viên mới ghi thêm là trực thuộc bộ phận nào, chi nhánh nào (HN, DN, HCM?)"
    )

    Post.create!(
      title: "Suggest lót thảm bên trong văn phòng",
      user_id: 1,
      type: 0,
      content: "Sau khi ra thăm văn phòng HN, có suggest là văn phòng Đà Nẵng cũng nên lót thảm bên trong như văn phòng HN.
      Dạo một vòng quanh văn phòng các tầng trên Vĩnh Trung Plaza thấy công ty nào cũng lót thảm trong văn phòng, nhìn rất đẹp ạ :D"
    )

    Post.create!(
      title: "Radio confesstion",
      user_id: 1,
      type: 0,
      content: "Chương trình radio confession rất hay, nhưng có những lúc ngày
      cuối tháng rơi vào giữa tuần làm mọi người không nghe được do bận làm
      việc. Vì vậy đề nghị ban phát thanh nghiên cứu sắp xếp lịch vào NGÀY
      THỨ 6 CUỐI CÙNG TRONG THÁNG thì sẽ hợp lý hơn."
    )

    Post.create!(
      title: "Ăn sáng ở công ty",
      user_id: 1,
      type: 0,
      content: "Cảm ơn Công ty đã trả lời ý kiến của mình.
      Như vậy nếu mình ăn sau 7h45, ngồi ở FS, ý thức là đến giờ làm việc rồi nên sẽ ăn trong 5-10ph thôi và k gây ồn ảnh hưởng xung quanh, thì có được phép k?
      Mình muốn câu trả lời rõ ràng chứ k vòng vo là Công ty k hạn chế nhưng mọi người nên sắp xếp... Bởi vì không sắp xếp được ăn sáng trước đó (con nhỏ đi học sớm, sáng lỡ dậy trễ, trời mưa...hoặc đồng nghiệp muốn ăn cùng nhau) chứ k cố ý.
      Nên mình muốn câu trả lời là có được phép hay k, nếu k thì để anh em biết tránh luôn. Còn cho phép thì để mọi người thoải mái, chứ k phải như giờ ăn 5ph thôi mà nhìn trước ngó sau, hồi hộp lỡ leader hay mana đi qua bắt gặp rồi đánh giá!"
    )

    Post.create!(
      title: "Góp ý gửi mail",
      user_id: 1,
      type: 0,
      content: "Vui lòng tạo group mail HN, các thông báo cho HN cũng mail về cho những người cần."
    )


    Post.create!(
      title: "Làm sao test R.E.S.T",
      user_id: 4,
      type: 1,
      content: "Chào mọi người mình là mem mới. Mình đang chuẩn bị cho việc test 1 dự án thông qua Webservice (R.E.S.T).
      Mình thì không có kinh nghiệm test API. Nên nhờ mọi người giới thiệu giúp mình tool test cho R.E.S.T và cách dùng tool đó thế nào luôn ạ.
      Cảm ơn mọi người.
      Chúc 1 ngày tốt lành."
    )

    Post.create!(
      title: "Responsive web",
      user_id: 4,
      type: 1,
      content: "Mọi người cho mình hỏi kinh nghiệm để code web reponsive theo hướng mobile-first. Mình cảm ơn."
    )
  end

  task create_replies: :environment do
    Reply.create!(
      user_id: 2,
      replyable_id: 1,
      replyable_type: Post.name,
      content: "<p>Em thử add css n&agrave;y nh&eacute;&nbsp;<img alt=\"yes\" class=\"smiley\"
        height=\"23\" src=\"http://localhost:3000/assets/ckeditor/plugins/smiley/images/thumbs_up.png\"
        title=\"yes\" width=\"23\" /></p>\r\n\r\n<pre class=\"hljs brush:
        css; syntaxhighlight\">\r\n\r\n.listing-grid img {\r\n\twidth: 23px;\r\n\theight:
        23px;\r\n\tposition: relative;\r\n\toverflow: hidden;\r\n\t-webkit-border-top-
        left-radius: 1px;\r\n\t-webkit-border-top-right-radius: 2px;\r\n\t-webkit-border-
        bottom-right-radius: 3px;\r\n\t-webkit-border-bottom-left-radius: 4px;\r\n\t-moz-
        border-radius-topleft: 1px;\r\n\t-moz-border-radius-topright: 2px;\r\n\t-moz-border-
        radius-bottomright: 3px;\r\n\t-moz-border-radius-bottomleft: 4px;\r\n\tborder-top-
        left-radius: 1px;\r\n\tborder-top-right-radius: 2px;\r\n\tborder-bottom-right-radius:
        3px;\r\n\tborder-bottom-left-radius: 4px;\r\n}\r\n\r\n</pre>\r\n\r\n<p>&nbsp;</p>\r\n"
    )

    Reply.create!(
      user_id: 6,
      replyable_id: 3,
      replyable_type: Post.name,
      content: "Cảm ơn bạn đã đóng góp ý kiến! Trong tất cả các hệ thống quản lý công việc, dự án (không chỉ riêng redmine),
      việc assign ticket hiện tại chỉ assign cho 1 member cụ thể nào đó trong project,
      còn việc sử dụng position để hệ thống tự động gán cho member thì hiện tại chưa có.
      Nếu có thể điều chỉnh chức năng như bạn chia sẻ, nhờ bạn trao đổi trực tiếp phương án với GL của mình để GL đó có thể chia sẻ lại
      với các GL và MN khác nhé, vì nếu có thể xử lý được việc tự động gán member như vậy thì sẽ rất hữu ích cho việc quản lý chung"
    )

    Reply.create!(
      user_id: 7,
      replyable_id: 4,
      replyable_type: Post.name,
      content: "Cảm ơn bạn đã đóng góp ý kiến!
      Hiện tại, IC team cũng đang lên kế hoạch để thay đổi format của chương trình Morning Speech,
      theo đó, phần bình chọn nhân viên có bài nói hay nhất trong tháng sẽ được thực hiện trên toàn chi nhánh,
      nội dung các bài nói sẽ được ghi lại để phục vụ quá trình bình chọn.
      Như vậy, những bạn không có điều kiện nghe MS do ngồi tại văn phòng khác hoặc đến muộn cũng có thể tiếp cận được nội dung các bài MS trước đó."
    )

    Reply.create!(
      user_id: 5,
      replyable_id: 5,
      replyable_type: Post.name,
      content: "Cảm ơn bạn đã đóng góp ý kiến!
      Đây là một ý kiến rất hữu ích.
      BO đã chuẩn bị sẵn những tấm biển báo Nhà vệ sinh/Toilet hỏng để mọi người chủ động treo lên trước cửa phòng vệ sinhkhi cần cảnh báo cho những người sử dụng tiếp theo.
      BO sẽ gửi thông báo trên box All một lần nữa để mọi người lưu ý về vấn đề này.
      Bên cạnh đó, khi có trường hợp nhà vệ sinh hỏng xảy ra, mọi người vui lòng báo trực tiếp cho BO sớm để BO thông báo toà nhà xử lý kịp thời nhé."
    )

    Reply.create!(
      user_id: 6,
      replyable_id: 5,
      replyable_type: Post.name,
      content: "Cảm ơn bạn đã đóng góp ý kiến!
      Công ty luôn chuẩn bị khăn lau mới cho các cô tạp vụ, tuy nhiên diện tích của công ty khá rộng nên có thể việc vệ sinh của các cô vẫn sẽ xẩy ra sơ suất,
      BO sẽ nhắc nhở thêm các cô về việc này. Nếu bạn thấy bàn vẫn tiếp tục bị bẩn vì bụi khăn, bạn vui lòng liên hệ trực tiếp với bộ phận Admin
      (Ms. Vũ Tuyết Mai và Ms. Lương Thu Hằng) để các bạn ấy biết được bàn đó thuộc khu vực nào, có cơ sở kiểm tra trực tiếp và báo lại các cô tạp vụ."
    )

    Reply.create!(
      user_id: 6,
      replyable_id: 6,
      replyable_type: Post.name,
      content: "Cảm ơn bạn đã đóng góp ý kiến!
      Công ty khuyến khích các bạn tự mang cốc cá nhân của mình lên công ty sử dụng để tránh lãng phí đồng thời cũng bảo vệ môi trường.
      Cốc nhựa hiện tại chỉ sử dụng trong trường hợp bất khả kháng cần dùng ngay và dùng 1 lần.
      Để đảm bảo sức khoẻ, tiết kiệm và bảo vệ môi trường, mọi người hãy sắm cho mình 1 chiếc cốc cá nhân đặt tại Công ty nhé, các cô tạp vụ sẽ giúp mọi người vệ sinh cốc hàng ngày vào cuối giờ làm việc !"
    )

    Reply.create!(
      user_id: 6,
      replyable_id: 8,
      replyable_type: Post.name,
      content: "Cảm ơn bạn đã đóng góp ý kiến!
      Bộ phận BO cũng thường xuyên liên hệ để trao đổi với tòa nhà về các vấn đề nhà vệ sinh,
      tuy nhiên với tần số sử dụng đông như Công ty mình thì ý thức giữ gìn vệ sinh chung đóng vai trò rất quan trọng.
      Vì vậy, một mặt BO vẫn nhắc nhở tòa nhà chú ý hơn trong việc dọn dẹp, một mặt rất mong mỗi cá nhân có ý thức hơn nữa trong quá trình sử dụng nhà vệ sinh.
      Hai vẫn đề nổi bật Công ty xin được trả lời như sau:
      1. Về vòi nước rửa tay quá ngắn: đây là thiết kế chung cho tất cả các nhà vệ sinh trong tòa nhà, nên phía tòa nhà không thể thay đổi riêng cho phía Framgia được, mong bạn thông cảm.
      2. Về mùi thơm: Cũng có khi máy tỏa mùi thơm bị hết pin cần reset lại, BO đã yêu cầu tòa nhà lên kiểm tra và xử lý khu vực WC nam của công ty."
    )

    Reply.create!(
      user_id: 7,
      replyable_id: 4,
      replyable_type: Post.name,
      content: "Cảm ơn bạn đã đóng góp ý kiến!
      Đây cũng là vấn đề mà công ty đã nhắc nhở chung nhiều lần trên các phương tiện khác nhau nhưng vẫn có những trường hợp nói to gây ồn làm ảnh hưởng đến mọi người xung quanh.
      IC team sẽ cân nhắc thêm phương án để truyền thông tới mọi người lưu ý hơn về vấn đề ý thức nơi làm việc.
      Đồng thời, IC team cũng đã nhắc nhở team dự án ngồi tại khu vực này chú ý trong việc trao đổi giữa các thành viên trong team. Các bạn ấy đã rút kinh nghiệm không nói quá to để tránh làm mất tập trung mọi người ngồi gần đó.
      Đôi khi do các team say sưa bàn công việc quá mà vô tình gây ảnh hưởng đến mọi người xunh quanh, vấn đề này chúng ta  cũng có thể trực tiếp nhắc nhở lẫn nhau,
      cùng nhau nâng cao ý thức tại nơi làm việc, như vậy việc cải thiện các vấn đề trong công ty sẽ nhanh và dễ dàng hơn rất nhiều"
    )

    Reply.create!(
      user_id: 5,
      replyable_id: 5,
      replyable_type: Post.name,
      content: "Cảm ơn bạn đã đóng góp ý kiến!
      Đối với các trường hợp như vậy, bạn vui lòng nhắc nhở trực tiếp bạn ấy hoặc báo lại cho BO chi nhánh Đà Nẵng để BO nhắc nhở bạn ấy rút kinh nghiệm khi sử dụng vật dụng chung trong Công ty."
    )

    Reply.create!(
      user_id: 5,
      replyable_id: 6,
      replyable_type: Post.name,
      content: "Cảm ơn bạn đã đóng góp ý kiến!
      Các bộ phận phụ trách thường quote lại các thông báo để remind nhân viên vì sợ mọi người bị miss những thông tin.
      Các bộ phận sẽ xem xét tính quan trọng của các thông báo để thay đổi tần suất quote lại kèm với việc mention tất cả nhân viên cho phù hợp."
    )

    Reply.create!(
      user_id: 5,
      replyable_id: 7,
      replyable_type: Post.name,
      content: "Cảm ơn bạn đã đóng góp ý kiến!
      Trong cộng đồng các Công ty Công nghệ thông tin đặc biệt là các Công ty Nhật Bản,
      Cả 2 từ viết tắt BSE và BrSE đều thể hiện thuật ngữ Bridge System/Software Engineer (Kỹ sư cầu nối).
      Tuy nhiên, đúng như bạn nói, ở một lĩnh vực khác BSE lại là từ viết tắt của một thuật ngữ dễ gây hiểu lầm.
      Để tránh nhầm lẫn, Công ty sẽ xem xét việc thống nhất sử dụng duy nhất từ viết tắt duy nhất là BrSE cho vị trí Kỹ sư cầu nối."
    )

    Reply.create!(
      user_id: 5,
      replyable_id: 8,
      replyable_type: Post.name,
      content: "Cảm ơn bạn đã đóng góp ý kiến!
      Hiện tại với mỗi đợt nhân viên mới PA đều gửi mail 'Welcome new member' tới toàn bộ nhân viên công ty trong đó ghi rất rõ bộ phận công tác,
      văn phòng làm việc của nhân viên mới, bạn có thể tham khảo thông tin trong mail này.
      Đồng thời, PA cũng sẽ nhắc nhở nhân viên mới viết đầy đủ những thông tin cần thiết trong mail giới thiệu bản thân để các thành viên trong công ty nắm được rõ hơn."
    )

    Reply.create!(
      user_id: 5,
      replyable_id: 9,
      replyable_type: Post.name,
      content: "Cảm ơn bạn đã đóng góp ý kiến!
      Hiện tại, Công ty chưa có kế hoạch lót thảm trải sàn tại văn phòng Đà Nẵng do một vài lý do khách quan.
      Trong tương lai, nếu có kế hoạch nâng cấp và thay đổi nội thất văn phòng Đà Nẵng, chúng tôi sẽ lưu ý đề xuất này của bạn."
    )

    Reply.create!(
      user_id: 7,
      replyable_id: 9,
      replyable_type: Post.name,
      content: "Cảm ơn bạn đã đóng góp ý kiến! Lịch phát Radio Confession không
      cố định ngày thứ 6 cuối cùng của tháng. Mỗi tháng có 1 dịp lễ đặc biệt,
      ban phát thanh dựa vào đó để lên chủ đề, biên tập nội dung và phát vào
      các dịp lễ đặc biệt của tháng đó. Ban phát thanh đã quyết định chuyển giờ
      phát Radio Confession sang 12:45 thay cho nhạc báo thức buổi trưa để
      tránh ảnh hưởng đến công việc của các bạn."
    )

    Reply.create!(
      user_id: 8,
      replyable_id: 4,
      replyable_type: Post.name,
      content: "Cảm ơn bạn đã đóng góp ý kiến!
      Công ty mong muốn mọi người sắp xếp thời gian ăn sáng hợp lý để không bị ảnh hưởng đến công việc.
      Tuy nhiên nếu trong điều kiện khó khăn quá không thu xếp được thời gian ăn sáng trước giờ làm thì các bạn hoàn toàn có thể ăn sáng trong giờ với việc ý thức hơn và không gây ảnh hưởng đến mọi người xung quanh."
    )

    Reply.create!(
      user_id: 8,
      replyable_id: 1,
      replyable_type: Post.name,
      content: "Cảm ơn bạn đã đóng góp ý kiến!
      Mỗi chi nhánh đã có group mail riêng. Các bộ phận thường xuyên gửi thông báo sẽ lưu ý gửi đúng group mail của các chi nhánh."
    )

    Reply.create!(
      user_id: 3,
      replyable_id: 1,
      replyable_type: Post.name,
      content: "Manual test thì POSTMAN cũng tốt. Nhưng có cái tốt hơn POSTMAN 69 lần là INSOMNIA bạn nhé :)
      https://insomnia.rest/

      Một điểm khiến mình chuyển ngay từ POSTMAN sang INSOMNIA là INSOMNIA cho phép setup nhiều môi trường khác nhau.
      Ví dụ bạn có các môi trường development, staging, production với các API URL khác nhau, bạn có thể định nghĩa các URL đó với từng môi trường, lúc test môi trường nào switch sang môi trường đó.
      POSTMAN không làm được điều này, phải đổi bằng tay hoặc phải save ra nhiều câu request giống nhau."
    )

    Reply.create!(
      user_id: 3,
      replyable_id: 5,
      replyable_type: Post.name,
      content: "Bạn có thể đọc và tham khảo từ những bài viết này nhé:
      https://developers.google.com/web/fundamentals/design-and-ui/responsive"
    )
  end

  task create_tags: :environment do
    Tag.create!(
      name: "Jquery",
    )

    Tag.create!(
      name: "Ajax",
    )

    Tag.create!(
      name: "Ruby",
    )

    Tag.create!(
      name: "Ruby on rails",
    )

    Tag.create!(
      name: "PHP",
    )

    Tag.create!(
      name: "Laravel",
    )

    Tag.create!(
      name: "Javascript",
    )

    Tag.create!(
      name: "IOS",
    )

    Tag.create!(
      name: "Android",
    )

    Tag.create!(
      name: "Java",
    )

    Tag.create!(
      name: ".NET",
    )
  end

  task create_post_tags: :environment do
    PostTag.create!(
      post_id: 1,
      tag_id: 1,
    )

    PostTag.create!(
      post_id: 1,
      tag_id: 2,
    )

    PostTag.create!(
      post_id: 2,
      tag_id: 3,
    )

    PostTag.create!(
      post_id: 2,
      tag_id: 4,
    )
    PostTag.create!(
      post_id: 3,
      tag_id: 5,
    )
    PostTag.create!(
      post_id: 3,
      tag_id: 3,
    )
    PostTag.create!(
      post_id: 4,
      tag_id: 5,
    )
  end
end
