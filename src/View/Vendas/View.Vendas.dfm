object ViewVendas: TViewVendas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Vendas'
  ClientHeight = 590
  ClientWidth = 1092
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object pnBackTudo: TPanel
    Left = 0
    Top = 0
    Width = 1092
    Height = 590
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 20
    Padding.Top = 20
    Padding.Right = 20
    Padding.Bottom = 20
    TabOrder = 0
    object pn_msgTopo: TPanel
      Left = 20
      Top = 20
      Width = 1052
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Color = 15456255
      Padding.Left = 10
      ParentBackground = False
      TabOrder = 0
      object lbMSG: TLabel
        Left = 10
        Top = 0
        Width = 1042
        Height = 41
        Align = alClient
        Caption = 'Tecle F2 para iniciar uma nova venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 360
        ExplicitHeight = 30
      end
    end
    object pnCorpo: TPanel
      Left = 20
      Top = 61
      Width = 1052
      Height = 509
      Align = alClient
      BevelOuter = bvNone
      Padding.Top = 5
      TabOrder = 1
      object pnCorpoEsquerda: TPanel
        Left = 0
        Top = 5
        Width = 333
        Height = 504
        Align = alLeft
        BevelOuter = bvNone
        Padding.Right = 5
        TabOrder = 0
        object Lançamento: TLabel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 328
          Height = 21
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Lan'#231'amento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 94
        end
        object edtLancamento: TEdit
          AlignWithMargins = True
          Left = 0
          Top = 26
          Width = 328
          Height = 29
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 10
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnKeyPress = edtLancamentoKeyPress
        end
        object pnBackValores: TPanel
          Left = 0
          Top = 65
          Width = 212
          Height = 381
          Align = alClient
          BevelOuter = bvNone
          Padding.Right = 10
          TabOrder = 1
          object Label2: TLabel
            AlignWithMargins = True
            Left = 0
            Top = 65
            Width = 202
            Height = 21
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 5
            Align = alTop
            Caption = 'Valor Unit'#225'rio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 107
          end
          object Label3: TLabel
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 202
            Height = 21
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 5
            Align = alTop
            Caption = 'Quantidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 90
          end
          object Label4: TLabel
            AlignWithMargins = True
            Left = 0
            Top = 130
            Width = 202
            Height = 21
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 5
            Align = alTop
            Caption = '- Desconto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 82
          end
          object Label5: TLabel
            AlignWithMargins = True
            Left = 0
            Top = 195
            Width = 202
            Height = 21
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 5
            Align = alTop
            Caption = '+ Acr'#233'scimo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 94
          end
          object Label6: TLabel
            AlignWithMargins = True
            Left = 0
            Top = 260
            Width = 202
            Height = 21
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 5
            Align = alTop
            Caption = 'Total L'#237'quido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 100
          end
          object edtQuantidade: TDBEdit
            AlignWithMargins = True
            Left = 0
            Top = 26
            Width = 202
            Height = 29
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 10
            Align = alTop
            Color = clBtnFace
            DataField = 'QUANTIDADE'
            DataSource = DSVendasItensListar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object edtValorUnitario: TDBEdit
            AlignWithMargins = True
            Left = 0
            Top = 91
            Width = 202
            Height = 29
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 10
            Align = alTop
            Color = clBtnFace
            DataField = 'VALOR_UNITARIO'
            DataSource = DSVendasItensListar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object edtDesconto: TDBEdit
            AlignWithMargins = True
            Left = 0
            Top = 156
            Width = 202
            Height = 29
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 10
            Align = alTop
            Color = clBtnFace
            DataField = 'DESCONTO'
            DataSource = DSVendasItensListar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object edtAcrescimo: TDBEdit
            AlignWithMargins = True
            Left = 0
            Top = 221
            Width = 202
            Height = 29
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 10
            Align = alTop
            Color = clBtnFace
            DataField = 'ACRESCIMO'
            DataSource = DSVendasItensListar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object edtTotalLiquido: TDBEdit
            AlignWithMargins = True
            Left = 0
            Top = 286
            Width = 202
            Height = 29
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 10
            Align = alTop
            Color = clBtnFace
            DataField = 'TOTAL_LIQUIDO'
            DataSource = DSVendasItensListar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
        end
        object pnImagemItem: TPanel
          Left = 212
          Top = 65
          Width = 116
          Height = 381
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 2
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 116
            Height = 119
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object imgFoto: TImage
              Left = 0
              Top = 0
              Width = 116
              Height = 119
              Align = alClient
              Center = True
              Picture.Data = {
                0A544A504547496D6167659A140000FFD8FFE000104A46494600010101004800
                480000FFE20C584943435F50524F46494C4500010100000C484C696E6F021000
                006D6E74725247422058595A2007CE00020009000600310000616373704D5346
                540000000049454320735247420000000000000000000000000000F6D6000100
                000000D32D485020200000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000001163707274000001
                500000003364657363000001840000006C77747074000001F000000014626B70
                7400000204000000147258595A00000218000000146758595A0000022C000000
                146258595A0000024000000014646D6E640000025400000070646D6464000002
                C400000088767565640000034C0000008676696577000003D4000000246C756D
                69000003F8000000146D6561730000040C000000247465636800000430000000
                0C725452430000043C0000080C675452430000043C0000080C62545243000004
                3C0000080C7465787400000000436F7079726967687420286329203139393820
                4865776C6574742D5061636B61726420436F6D70616E79000064657363000000
                0000000012735247422049454336313936362D322E3100000000000000000000
                0012735247422049454336313936362D322E3100000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000058595A20000000000000F35100010000000116CC58595A20000000
                0000000000000000000000000058595A200000000000006FA2000038F5000003
                9058595A2000000000000062990000B785000018DA58595A2000000000000024
                A000000F840000B6CF64657363000000000000001649454320687474703A2F2F
                7777772E6965632E636800000000000000000000001649454320687474703A2F
                2F7777772E6965632E6368000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000064657363000000
                000000002E4945432036313936362D322E312044656661756C74205247422063
                6F6C6F7572207370616365202D207352474200000000000000000000002E4945
                432036313936362D322E312044656661756C742052474220636F6C6F75722073
                70616365202D2073524742000000000000000000000000000000000000000000
                0064657363000000000000002C5265666572656E63652056696577696E672043
                6F6E646974696F6E20696E2049454336313936362D322E310000000000000000
                0000002C5265666572656E63652056696577696E6720436F6E646974696F6E20
                696E2049454336313936362D322E310000000000000000000000000000000000
                00000000000000000076696577000000000013A4FE00145F2E0010CF140003ED
                CC0004130B00035C9E0000000158595A2000000000004C09560050000000571F
                E76D656173000000000000000100000000000000000000000000000000000002
                8F00000002736967200000000043525420637572760000000000000400000000
                05000A000F00140019001E00230028002D00320037003B00400045004A004F00
                540059005E00630068006D00720077007C00810086008B00900095009A009F00
                A400A900AE00B200B700BC00C100C600CB00D000D500DB00E000E500EB00F000
                F600FB01010107010D01130119011F0125012B01320138013E0145014C015201
                5901600167016E0175017C0183018B0192019A01A101A901B101B901C101C901
                D101D901E101E901F201FA0203020C0214021D0226022F02380241024B025402
                5D02670271027A0284028E029802A202AC02B602C102CB02D502E002EB02F503
                00030B03160321032D03380343034F035A03660372037E038A039603A203AE03
                BA03C703D303E003EC03F9040604130420042D043B0448045504630471047E04
                8C049A04A804B604C404D304E104F004FE050D051C052B053A05490558056705
                770586059605A605B505C505D505E505F6060606160627063706480659066A06
                7B068C069D06AF06C006D106E306F507070719072B073D074F07610774078607
                9907AC07BF07D207E507F8080B081F08320846085A086E0882089608AA08BE08
                D208E708FB09100925093A094F09640979098F09A409BA09CF09E509FB0A110A
                270A3D0A540A6A0A810A980AAE0AC50ADC0AF30B0B0B220B390B510B690B800B
                980BB00BC80BE10BF90C120C2A0C430C5C0C750C8E0CA70CC00CD90CF30D0D0D
                260D400D5A0D740D8E0DA90DC30DDE0DF80E130E2E0E490E640E7F0E9B0EB60E
                D20EEE0F090F250F410F5E0F7A0F960FB30FCF0FEC1009102610431061107E10
                9B10B910D710F511131131114F116D118C11AA11C911E8120712261245126412
                8412A312C312E31303132313431363138313A413C513E5140614271449146A14
                8B14AD14CE14F01512153415561578159B15BD15E0160316261649166C168F16
                B216D616FA171D17411765178917AE17D217F7181B18401865188A18AF18D518
                FA19201945196B199119B719DD1A041A2A1A511A771A9E1AC51AEC1B141B3B1B
                631B8A1BB21BDA1C021C2A1C521C7B1CA31CCC1CF51D1E1D471D701D991DC31D
                EC1E161E401E6A1E941EBE1EE91F131F3E1F691F941FBF1FEA20152041206C20
                9820C420F0211C2148217521A121CE21FB22272255228222AF22DD230A233823
                66239423C223F0241F244D247C24AB24DA250925382568259725C725F7262726
                57268726B726E827182749277A27AB27DC280D283F287128A228D42906293829
                6B299D29D02A022A352A682A9B2ACF2B022B362B692B9D2BD12C052C392C6E2C
                A22CD72D0C2D412D762DAB2DE12E162E4C2E822EB72EEE2F242F5A2F912FC72F
                FE3035306C30A430DB3112314A318231BA31F2322A3263329B32D4330D334633
                7F33B833F1342B3465349E34D83513354D358735C235FD3637367236AE36E937
                243760379C37D738143850388C38C839053942397F39BC39F93A363A743AB23A
                EF3B2D3B6B3BAA3BE83C273C653CA43CE33D223D613DA13DE03E203E603EA03E
                E03F213F613FA23FE24023406440A640E74129416A41AC41EE4230427242B542
                F7433A437D43C044034447448A44CE45124555459A45DE4622466746AB46F047
                35477B47C04805484B489148D7491D496349A949F04A374A7D4AC44B0C4B534B
                9A4BE24C2A4C724CBA4D024D4A4D934DDC4E254E6E4EB74F004F494F934FDD50
                27507150BB51065150519B51E65231527C52C75313535F53AA53F65442548F54
                DB5528557555C2560F565C56A956F75744579257E0582F587D58CB591A596959
                B85A075A565AA65AF55B455B955BE55C355C865CD65D275D785DC95E1A5E6C5E
                BD5F0F5F615FB36005605760AA60FC614F61A261F56249629C62F06343639763
                EB6440649464E9653D659265E7663D669266E8673D679367E9683F689668EC69
                43699A69F16A486A9F6AF76B4F6BA76BFF6C576CAF6D086D606DB96E126E6B6E
                C46F1E6F786FD1702B708670E0713A719571F0724B72A67301735D73B8741474
                7074CC7528758575E1763E769B76F8775677B37811786E78CC792A798979E77A
                467AA57B047B637BC27C217C817CE17D417DA17E017E627EC27F237F847FE580
                4780A8810A816B81CD8230829282F4835783BA841D848084E3854785AB860E86
                7286D7873B879F8804886988CE8933899989FE8A648ACA8B308B968BFC8C638C
                CA8D318D988DFF8E668ECE8F368F9E9006906E90D6913F91A89211927A92E393
                4D93B69420948A94F4955F95C99634969F970A977597E0984C98B89924999099
                FC9A689AD59B429BAF9C1C9C899CF79D649DD29E409EAE9F1D9F8B9FFAA069A0
                D8A147A1B6A226A296A306A376A3E6A456A4C7A538A5A9A61AA68BA6FDA76EA7
                E0A852A8C4A937A9A9AA1CAA8FAB02AB75ABE9AC5CACD0AD44ADB8AE2DAEA1AF
                16AF8BB000B075B0EAB160B1D6B24BB2C2B338B3AEB425B49CB513B58AB601B6
                79B6F0B768B7E0B859B8D1B94AB9C2BA3BBAB5BB2EBBA7BC21BC9BBD15BD8FBE
                0ABE84BEFFBF7ABFF5C070C0ECC167C1E3C25FC2DBC358C3D4C451C4CEC54BC5
                C8C646C6C3C741C7BFC83DC8BCC93AC9B9CA38CAB7CB36CBB6CC35CCB5CD35CD
                B5CE36CEB6CF37CFB8D039D0BAD13CD1BED23FD2C1D344D3C6D449D4CBD54ED5
                D1D655D6D8D75CD7E0D864D8E8D96CD9F1DA76DAFBDB80DC05DC8ADD10DD96DE
                1CDEA2DF29DFAFE036E0BDE144E1CCE253E2DBE363E3EBE473E4FCE584E60DE6
                96E71FE7A9E832E8BCE946E9D0EA5BEAE5EB70EBFBEC86ED11ED9CEE28EEB4EF
                40EFCCF058F0E5F172F1FFF28CF319F3A7F434F4C2F550F5DEF66DF6FBF78AF8
                19F8A8F938F9C7FA57FAE7FB77FC07FC98FD29FDBAFE4BFEDCFF6DFFFFFFDB00
                430006040506050406060506070706080A100A0A09090A140E0F0C1017141818
                171416161A1D251F1A1B231C1616202C20232627292A29191F2D302D28302528
                2928FFDB0043010707070A080A130A0A13281A161A2828282828282828282828
                2828282828282828282828282828282828282828282828282828282828282828
                28282828282828FFC00011080073007603012200021101031101FFC4001F0000
                010501010101010100000000000000000102030405060708090A0BFFC400B510
                0002010303020403050504040000017D01020300041105122131410613516107
                227114328191A1082342B1C11552D1F02433627282090A161718191A25262728
                292A3435363738393A434445464748494A535455565758595A63646566676869
                6A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7
                A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2
                E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301010101010101
                01010000000000000102030405060708090A0BFFC400B5110002010204040304
                0705040400010277000102031104052131061241510761711322328108144291
                A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738
                393A434445464748494A535455565758595A636465666768696A737475767778
                797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4
                B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9
                EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FAA68A28A0028A28
                A0028A2B32FF005AB6B5251499641D97A0FA9A00D3A2B966D72FA76C5BC4A3D9
                54B1A4FB76B2BC94971EF0FF00F5A803AAA2B9983C43711B6DB9855BD71F29AD
                BB1D46DEF47EE5FE7EE8DC114016E8A28A0028A28A0028A28A0028A28A0028A2
                B17C4B7C60B716F19C4928E48ECBFF00D7A00A7ABEAB25D4DF65B127693B4B2F
                573E83DAAD69BA0C71A87BCFDE3FF707DD1FE354974397FB39274245CFDFD9ED
                E9F5AD3D0F54FB52F9139C5C2FAFF17FF5E80351112350B1AAAA8EC0629D4514
                0115C5B4370BB678D5C7B8AE7B52D164B63E7D8B310BCEDCFCCBF4F5AE8E4963
                8F1E648899E9B88144734521C4722391CE1581A00CAD0F56FB58F26E081381C1
                FEFF00FF005EB62B99F10589B5996F2DBE505BE6C7F0B7AD6E699762F6CD251C
                37461E86802D514514005145140051451400572B18FED2F11316E6346CFE0BD3
                F5AE9E66D90C8DFDD526B9EF092665B990F5000FCF3401A1E20BC9ACAD636808
                0CCF8248CF18ACDBBD3AEDE1179B552E97E66F2CFDEF7FAD5AF167FC7A43FF00
                5D3FA1AC21A95E8000B99703DE80348EAD7935BF996F2012463F791ED078FEF0
                FEB557FB72FF00FE7AAFFDF029C62965B74D46DC6C9431DEABFC58EAC07F3156
                5B52334024F2619605004B095E57DC1F4FE5401957B7B3DE94370C18AE718005
                259DDCD67233DBB0562307233C54BAA5B25BCC8D012609543A67B0F4AA5401DC
                C43EDFA5A89B1996319C7A9158BE1895A1BC9ED5FBF38F71C1ADBD27FE41B6DF
                F5CC7F2AC21FB9F1571FC4FF00CD6803A7A28A2800A28A2800A28A28023B85DD
                6F2A8EA548FD2B03C22D86B94EF853FCEBA3AE5B4D3F60F10490B70AC4A7E7C8
                A00BBE2CFF008F487FEBA7F435CBD757E288A496D22F2919F0F93B467B5735F6
                5B8FF9E12FFDF06803423691F47864B6244B6B212C07500F7A87767FD32CC056
                5FF5B17619EF8FEE9FD2A3B4FB6DA4BE64114CADD0FC87047BD5E37F780131E9
                F1A3B0C33084F340106A4E971656AF6C988A205597392849E9F4F4ACCAD39237
                B61F6B8226585FE592270703D8FB7A1AAF35A16025B4579216E800C943E86803
                AFD27FE41B6DFF005CC7F2AC293F79E2B1B7B38FD16B72C4FD9F4B84CC0AEC8C
                16CF6C0AC3F0F2B5D6AB35D30E065BF13FFD6CD0074F45145001451450014514
                50015CFF0089ED0FC97910395C2BE3B7A1AE829244591191C06561820F7A00A5
                A3DF2DF5A862479ABC38F7F5ABD5C9DDDB5C68D7827B724C24F07B63FBA6B774
                ED560BD50030497BA31FE5EB4017E8A28A00491164464750CAC3041EF5CC5C43
                36877A26832D6CE7041FE47FA1AEA0900649C0AC1D6F5783C97B7842CCCC30C7
                AA8FF1340116B9AB473DA2436AC4F9832FEA07A7D6B5344B3FB1D8AAB8C4AFF3
                3FF8565E81A49DCB7572B8039443FCCD74740051451400514514005145140051
                41200249C01DEA95A6A76B77288E0776246E526365561EA09183F85005C91164
                428EA194F0411C1AC0BEF0F82C5EC9F6F7D8DD3F035D051401CA06D66CBE5C4C
                547B6F14BFDABAAB702339F688D7452DE4315DC56AECC26941645D8482075E71
                8AB1401C99B5D5B50389BCC087FBE768FCAB574ED0E1B622498F9D28E991F28F
                C2B5E8A0028A28A0028A28A0028A28A0028A28A0064C0185C14DE0A9CA8FE2F6
                AE5C457DF6696DF4C37EB0790CBB2E90298CF1B551B824F51D48F7AEAE8A00E5
                6DB4F329893CA98DBB5C23491340614002383C679E76E7B1E2AC699A735ADCD9
                4890BA30927491893FEAF2DB01F6E1715D15140193A8890EB366522959561994
                BAA92A0B6DC64FFC04D642E8BFE88A0DABEF3A764F27267038279FBDEF5D6D14
                01CB5F43752EA30BFD9A412C6F0159122C965CAEF25F3C63E618FF001AA6F04F
                E6AC50412C7A934571E64C48FDE9E39073CF5E3A6338E2BB5A861B4B68259258
                608A3924E5DD5002DF53401CDDBE9E65F2D0453981AE11A488C06150023E78CF
                3DB3D8F15634DD35AD6EACA5481D184F3A3B64F117CDB01F6E1715D151400514
                5140051451400514514005145140051451400514514005145140051451400514
                5140051451401FFFD9}
              Proportional = True
              ExplicitLeft = -2
              ExplicitTop = -1
              ExplicitWidth = 124
              ExplicitHeight = 115
            end
          end
        end
        object pn_rodape_esquerda: TPanel
          Left = 0
          Top = 446
          Width = 328
          Height = 58
          Align = alBottom
          BevelOuter = bvNone
          Color = 15456255
          ParentBackground = False
          TabOrder = 3
          object Label7: TLabel
            Left = 10
            Top = 6
            Width = 86
            Height = 15
            Caption = 'F2 - Nova venda'
          end
          object Label8: TLabel
            Left = 10
            Top = 22
            Width = 93
            Height = 15
            Caption = 'F3 - Fechar venda'
          end
          object Label9: TLabel
            Left = 10
            Top = 38
            Width = 104
            Height = 15
            Caption = 'F3 - Cancelar venda'
          end
          object Label10: TLabel
            Left = 126
            Top = 6
            Width = 174
            Height = 15
            Caption = 'ESC - Cancelar venda/Fechar tela'
          end
          object Label11: TLabel
            Left = 126
            Top = 22
            Width = 111
            Height = 15
            Caption = 'DEL - Excluir produto'
          end
        end
      end
      object pnCorpoDireita: TPanel
        Left = 333
        Top = 5
        Width = 719
        Height = 504
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 10
        Align = alClient
        BevelOuter = bvNone
        Padding.Top = 5
        TabOrder = 1
        object pn_rodape_direita: TPanel
          Left = 0
          Top = 446
          Width = 719
          Height = 58
          Align = alBottom
          BevelOuter = bvNone
          Color = 15456255
          ParentBackground = False
          TabOrder = 0
          object Panel3: TPanel
            Left = 456
            Top = 0
            Width = 263
            Height = 58
            Align = alRight
            BevelOuter = bvNone
            Color = 15456255
            ParentBackground = False
            TabOrder = 0
            DesignSize = (
              263
              58)
            object Label12: TLabel
              Left = 53
              Top = 3
              Width = 113
              Height = 21
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 5
              Anchors = [akRight, akBottom]
              Caption = 'Total da Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edtTotaldaVenda: TDBEdit
              Left = 51
              Top = 25
              Width = 203
              Height = 29
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 10
              Anchors = [akRight, akBottom]
              DataField = 'TOTAL_LIQUIDO'
              DataSource = DSVendasCadastrar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
          end
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 456
            Height = 58
            Align = alClient
            BevelOuter = bvNone
            Color = 15456255
            ParentBackground = False
            TabOrder = 1
            object Label13: TLabel
              Left = 6
              Top = 6
              Width = 50
              Height = 15
              Caption = 'Venda n'#186':'
            end
            object Label14: TLabel
              Left = 182
              Top = 6
              Width = 62
              Height = 15
              Caption = 'Data Venda:'
            end
            object lbDbVendasNumero: TDBText
              Left = 62
              Top = 6
              Width = 107
              Height = 17
              DataField = 'ID'
              DataSource = DSVendasCadastrar
            end
            object lbDBDataVenda: TDBText
              Left = 250
              Top = 6
              Width = 107
              Height = 17
              DataField = 'DATA'
              DataSource = DSVendasCadastrar
            end
          end
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 5
          Width = 719
          Height = 441
          Align = alClient
          DataSource = DSVendasItensListar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = DBGrid1DrawColumnCell
          OnTitleClick = DBGrid1TitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_PRODUTO'
              Title.Caption = 'C'#243'd.Produto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRODUTONOME'
              Title.Caption = 'Produto'
              Width = 220
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANTIDADE'
              Title.Alignment = taCenter
              Title.Caption = 'Quant.'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_UNITARIO'
              Title.Alignment = taCenter
              Title.Caption = 'Unit'#225'rio'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCONTO'
              Title.Alignment = taCenter
              Title.Caption = 'Desconto'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACRESCIMO'
              Title.Alignment = taCenter
              Title.Caption = 'Acr'#233'scimo'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_LIQUIDO'
              Title.Alignment = taCenter
              Title.Caption = 'Total'
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Width = 60
              Visible = True
            end>
        end
      end
    end
  end
  object DSVendasCadastrar: TDataSource
    DataSet = ModelVendasDm.QVendasCadastrar
    Left = 736
    Top = 536
  end
  object DSVendasItensListar: TDataSource
    DataSet = ModelVendasDm.QVendasItensListar
    OnDataChange = DSVendasItensListarDataChange
    Left = 584
    Top = 304
  end
  object DSVendasItensCadastrar: TDataSource
    DataSet = ModelVendasDm.QVendasItensCadastrar
    Left = 264
    Top = 296
  end
end
