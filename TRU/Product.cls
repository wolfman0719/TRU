/// Describes an Things-R-Us product.
Class TRU.Product Extends (%Persistent, %XML.Adaptor) [ ClassType = persistent, Inheritance = right, ProcedureBlock ]
{

Parameter XMLNAME = "product";

Index Code On Code [ Unique ];

Index ShortName On ShortName [ Unique ];

/// Product code
Property Code As %String(MAXLEN = 12, TRUNCATE = 1, XMLNAME = "code", XMLPROJECTION = "attribute") [ Required ];

/// Product name
Property Name As %String(MAXLEN = 100, TRUNCATE = 1, XMLNAME = "name", XMLPROJECTION = "attribute");

/// Product short name
Property ShortName As %String(MAXLEN = 30, TRUNCATE = 1, XMLNAME = "shortName", XMLPROJECTION = "attribute");

/// Product description
Property Description As %String(MAXLEN = 100, TRUNCATE = 1, XMLNAME = "description", XMLPROJECTION = "attribute");

/// Product price
Property UnitPrice As %Numeric(MINVAL = 0, XMLNAME = "price", XMLPROJECTION = "attribute");

/// Product weight
Property Weight As %Numeric(MINVAL = 0, XMLNAME = "weight", XMLPROJECTION = "attribute");

/// Name of image file
Property ImageFile As %String(MAXLEN = 100, TRUNCATE = 1, XMLNAME = "image", XMLPROJECTION = "attribute");

/// If you create your own products, make sure that the "code" attribute
/// starts with Q0001 and are sequential (Q0002, Q0003, etc.). The logic in
/// the method ##class(TRU.WebService).Test that simulates orders depends
/// on this format for the "code" attribute.
/// 
XData DefaultData
{
<inventory>
<product code="Q0001" shortName="ｴｰｽ" name="穴の中のエース" price="49.95" image="AceOfSpades.jpg" description="備えあれば憂いなし。穴の中のエースがいつ必要になるかはわからない" weight="1" />
<product code="Q0002" shortName="ｺｰﾋｰﾌﾞﾚｰｸ" name="正式なコーヒーブレーク" price="39.95" image="coffee.jpg"  description="リラックスする時間を取りましょう(コーヒーはありません)" weight="5"/>
<product code="Q0003" shortName="秘密" name="秘密の本" price="22.95" image="book.jpg"  description="(説明はありません。秘密です!)" weight="10"/>
<product code="Q0004" shortName="秤" name="真実のチェッカー" price="19.95" image="bathroomscale.jpg" description="" weight="20"/>
<product code="Q0005" shortName="煙検知器" name="バジェット煙検知器" price="14.95" image="smokedetector.jpg"   description="炎に直接かざすと、より効果的です。" weight="12"/>
<product code="Q0006" shortName="ｽﾄﾚｽ管理" name="エグゼクティブ用ストレス管理ツール" price="199.95" image="slinky.jpg" description="" weight="2"/>
<product code="Q0007" shortName="記憶装置" name="昔の記憶装置" price="89.95" image="oldfloppydisk.jpg"   description="最近発見された1980年代の遺物。" weight="2"/>
<product code="Q0008" shortName="ﾊﾞﾅｰ" name="バックバナー" price="99.95" image="StoveTop.jpg"   description="優先順位の低いプロジェクトに最適な場所です。" weight="50"/>
<product code="Q0009" shortName="ｳｨｼﾞｪｯﾄ" name="公式理論ウィジェット" price="4.95" image="gear.jpg"   description="聞いたことがあると思います。これであなたも所有できます。" weight="7"/>
<product code="Q0010" shortName="効率化" name="エフィシェンシー・オプティマイザー" price="9.95" image="scissors.jpg"   description="お役所仕事を切り抜けるための完璧なツールです。" weight="4"/>
<product code="Q0011" shortName="ｿﾘﾃｨｱ" name="ソリティアのバックアップ" price="19.95" image="deckOfCards.jpg"  description="コンピュータの問題？伝統的な方法でソリティアをプレイ。" weight="3"/>
<product code="Q0012" shortName="眼鏡" name="オプティカル・エンハンサー" price="50.95" image="glasses.jpg"  description="" weight="100"/>
<product code="Q0013" shortName="余暇" name="エクストラタイム" price="19.95" image="pocketwatch.jpg"   description="時間が必要なときには、それを買えばいい。" weight="6"/>
<product code="Q0014" shortName="意思決定" name="エグゼクティブの意思決定" price="19.95" image="whitedice.jpg"   description="重要な決断のための6つのオプションを提供します。" weight="3"/>
<product code="Q0015" shortName="ｵｰﾌﾟﾅｰ" name="重要なエグゼクティブツール" price="19.95" image="bottleopener.jpg"  description="エグゼクティブの間で最も重要な機器として評価されています。" weight="7"/>
<product code="Q0016" shortName="ﾃﾚﾏｶﾞｲﾄﾞ" name="テレマーケティング撲滅ガイド" price="8.95" image="highlowoff.jpg"   description="電話勧誘を排除するための詳細なガイドです。" weight="3"/>
</inventory>
}

/// Load default data for this table
ClassMethod BuildData(DisplayFlag As %Boolean = 1) As %Status
{
	Set tSC = $$$OK
	Set tClassDef = ##class(%Dictionary.CompiledClass).%OpenId(..%ClassName(1))
	Set tIndex = tClassDef.XDatas.FindObjectId(..%ClassName(1)_"||DefaultData")
	If (tIndex = "") {
		Write:DisplayFlag "既定データが定義されていない",!
		Quit tSC
	}

	Set tStream = tClassDef.XDatas.GetAt(tIndex).Data
	Do tStream.Rewind()

	Set tReader = ##class(%XML.Reader).%New()
	Set tSC = tReader.OpenStream(tStream)
	If $$$ISERR(tSC) Quit tSC

	Do tReader.Correlate("product",..%ClassName(1))
	
	// delete existing data
	Do ..%KillExtent()
	Do ##class(ProductSale).%KillExtent()
	Do ##class(ProductInventory).%KillExtent()

	Set n = 1	
	While (tReader.Next(.tProduct,.tSC)) {
		Write:DisplayFlag n,?5,tProduct.Name,!
		Set tSC = tProduct.%Save()
		If $$$ISERR(tSC) {
			Do:DisplayFlag $System.Status.DisplayError(tSC)
			Quit
		}
		Set n = n + 1
	}

	Quit tSC
}

/// List of avaliable products
Query Enumerate() As %SQLQuery
{
	SELECT %ID,Name
	FROM Product
 	ORDER BY Name
	/*
	SELECT %ID,Name,Code,UnitPrice,ImageFile,Description
	FROM Product
 	ORDER BY Name
 	*/
}

/// Find and open an instance of Product object by Code
ClassMethod FindByCode(pCode As %String) As Product
{
	Set id = ""

	&sql(SELECT %ID INTO :id 
			FROM Product
			WHERE Code = :pCode )

	Quit ..%OpenId(id)
}

Storage Default
{
<Data name="ProductDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ImageFile</Value>
</Value>
<Value name="3">
<Value>Name</Value>
</Value>
<Value name="4">
<Value>UnitPrice</Value>
</Value>
<Value name="5">
<Value>Description</Value>
</Value>
<Value name="6">
<Value>Code</Value>
</Value>
<Value name="7">
<Value>Weight</Value>
</Value>
<Value name="8">
<Value>ShortName</Value>
</Value>
</Data>
<DataLocation>^TRU.ProductD</DataLocation>
<DefaultData>ProductDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^TRU.ProductD</IdLocation>
<IndexLocation>^TRU.ProductI</IndexLocation>
<StreamLocation>^TRU.ProductS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
