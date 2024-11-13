<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Page</title>
<link rel="stylesheet" href="resources/css/addTrip.css">
<script src="resources/js/addTrip.js"></script>
</head>
<body>
	<fmt:setLocale value="${param.language}" />
	<fmt:setBundle basename="bundle.webBundle" />
	<%@include file="menu.jsp"%>

	<div class="container">
		<!-- About Me Section -->
		<section class="about">
			<br> <br>
			<h2>About Your Trip</h2>
			<p>How was your trip? Share where you visited and the special
				moments you experienced</p>
		</section>

		<!-- Skills Section -->
		<section class="mytrip">
			<h2><fmt:message key="MyTrip" /></h2>
			<form action="addTripAction.jsp" method="post"
				enctype="multipart/form-data">
				<div class="form-group">
					<label for="title"><fmt:message key="Email" />:</label> <input
						type="text" name="email" id="email">
				</div>
				<div class="form-group">
					<label for="country"><fmt:message key="Country" />:</label> <select
						id="country" name="country" onchange="updateRegions()">
						<option value="" selected>Select a country</option>
						<option value="Korea"><fmt:message key="Korea" /></option>
						<option value="China"><fmt:message key="China" /></option>
						<option value="Japan"><fmt:message key="Japan" /></option>
						<option value="France"><fmt:message key="France" /></option>
						<option value="Italy"><fmt:message key="Italy" /></option>
						<option value="USA"><fmt:message key="USA" /></option>
						<option value="Canada"><fmt:message key="Canada" /></option>
						<option value="Germany"><fmt:message key="Germany" /></option>
						<option value="UnitedKingdom"><fmt:message key="UnitedKingdom" /></option>
						<option value="Australia"><fmt:message key="Australia" /></option>
						<option value="Spain"><fmt:message key="Spain" /></option>
						<option value="Mexico"><fmt:message key="Mexico" /></option>
						<option value="Brazil"><fmt:message key="Brazil" /></option>
						<option value="India"><fmt:message key="India" /></option>
						<option value="Egypt"><fmt:message key="Egypt" /></option>
						<option value="SouthAfrica"><fmt:message key="SouthAfrica" /></option>
						<option value="Thailand"><fmt:message key="Thailand" /></option>
						<option value="Argentina"><fmt:message key="Argentina" /></option>
						<option value="Russia"><fmt:message key="Russia" /></option>
						<option value="Turkey"><fmt:message key="Turkey" /></option>
						<option value="Switzerland"><fmt:message key="Switzerland" /></option>
						<option value="Sweden"><fmt:message key="Sweden" /></option>
						<option value="Portugal"><fmt:message key="Portugal" /></option>
						<option value="Norway"><fmt:message key="Norway" /></option>
						<option value="Netherlands"><fmt:message key="Netherlands" /></option>
						<option value="Greece"><fmt:message key="Greece" /></option>
						<option value="NewZealand"><fmt:message key="NewZealand" /></option>
						<option value="Indonesia"><fmt:message key="Indonesia" /></option>
						<option value="Malaysia"><fmt:message key="Malaysia" /></option>
					</select> <label for="country"><fmt:message key="Region" />:</label> <select id="region"
						name="region">
						<option value="">Select a region</option>
					</select>
				</div>
				<div class="form-group">
					<label for="title">Title:</label> <input type="text" name="title"
						id="title">
				</div>
				<div class="form-group">
					<label for="content">Content:</label>
					<textarea name="content" id="content" rows="10"></textarea>
				</div>
				<div class="form-group">
					<label>Main Image:</label> <input type="file" name="mainpicture">
				</div>
				<div class="form-group">
					<label>Additional Images:</label> <input type="file"
						name="pictures" multiple>
				</div>
				<div class="form-group">
					<button type="button" onclick="addImageInput()">Add Image</button>
				</div>
				<div id="additional-images">
					<!-- Additional image inputs will be added here -->
				</div>
				<div class="form-group">
					<input type="submit" value="Submit">
				</div>
			</form>

		</section>
	</div>

	<%@include file="footer.jsp"%>
	<script type="text/javascript">
	const regionsByCountry = {
		    Korea: ["<fmt:message key='Korea.Seoul'/>", "<fmt:message key='Korea.Busan'/>", "<fmt:message key='Korea.Incheon'/>", "<fmt:message key='Korea.Daegu'/>", "<fmt:message key='Korea.Daejeon'/>", "<fmt:message key='Korea.Gwangju'/>", "<fmt:message key='Korea.Suwon'/>", "<fmt:message key='Korea.Ulsan'/>", "<fmt:message key='Korea.Jeonju'/>", "<fmt:message key='Korea.Jeju'/>", "<fmt:message key='Korea.Pohang'/>"],
		    China: ["<fmt:message key='China.Beijing'/>", "<fmt:message key='China.Shanghai'/>", "<fmt:message key='China.Guangzhou'/>", "<fmt:message key='China.Shenzhen'/>", "<fmt:message key='China.Chengdu'/>", "<fmt:message key='China.Xi'an'/>", "<fmt:message key='China.Hangzhou'/>", "<fmt:message key='China.Wuhan'/>", "<fmt:message key='China.Chongqing'/>", "<fmt:message key='China.Nanjing'/>", "<fmt:message key='China.Suzhou'/>"],
		    Japan: ["<fmt:message key='Japan.Tokyo'/>", "<fmt:message key='Japan.Osaka'/>", "<fmt:message key='Japan.Kyoto'/>", "<fmt:message key='Japan.Hokkaido'/>", "<fmt:message key='Japan.Nagoya'/>", "<fmt:message key='Japan.Fukuoka'/>", "<fmt:message key='Japan.Sapporo'/>", "<fmt:message key='Japan.Hiroshima'/>", "<fmt:message key='Japan.Sendai'/>", "<fmt:message key='Japan.Yokohama'/>", "<fmt:message key='Japan.Kobe'/>"],
		    France: ["<fmt:message key='France.Paris'/>", "<fmt:message key='France.Nice'/>", "<fmt:message key='France.Marseille'/>", "<fmt:message key='France.Lyon'/>", "<fmt:message key='France.Bordeaux'/>", "<fmt:message key='France.Toulouse'/>", "<fmt:message key='France.Lille'/>", "<fmt:message key='France.Nantes'/>", "<fmt:message key='France.Strasbourg'/>", "<fmt:message key='France.Montpellier'/>", "<fmt:message key='France.Cannes'/>", "<fmt:message key='France.Avignon'/>"],
		    Italy: ["<fmt:message key='Italy.Rome'/>", "<fmt:message key='Italy.Venice'/>", "<fmt:message key='Italy.Florence'/>", "<fmt:message key='Italy.Milan'/>", "<fmt:message key='Italy.Naples'/>", "<fmt:message key='Italy.Turin'/>", "<fmt:message key='Italy.Bologna'/>", "<fmt:message key='Italy.Palermo'/>", "<fmt:message key='Italy.Catania'/>", "<fmt:message key='Italy.Verona'/>", "<fmt:message key='Italy.Genoa'/>", "<fmt:message key='Italy.Siena'/>"],
		    USA: ["<fmt:message key='USA.NewYork'/>", "<fmt:message key='USA.LosAngeles'/>", "<fmt:message key='USA.Chicago'/>", "<fmt:message key='USA.Miami'/>", "<fmt:message key='USA.SanFrancisco'/>", "<fmt:message key='USA.LasVegas'/>", "<fmt:message key='USA.WashingtonDC'/>", "<fmt:message key='USA.Boston'/>", "<fmt:message key='USA.Dallas'/>", "<fmt:message key='USA.Seattle'/>", "<fmt:message key='USA.Austin'/>", "<fmt:message key='USA.Philadelphia'/>"],
		    Canada: ["<fmt:message key='Canada.Toronto'/>", "<fmt:message key='Canada.Vancouver'/>", "<fmt:message key='Canada.Montreal'/>", "<fmt:message key='Canada.Ottawa'/>", "<fmt:message key='Canada.Calgary'/>", "<fmt:message key='Canada.QuebecCity'/>", "<fmt:message key='Canada.Edmonton'/>", "<fmt:message key='Canada.Winnipeg'/>", "<fmt:message key='Canada.Halifax'/>", "<fmt:message key='Canada.Victoria'/>"],
		    Germany: ["<fmt:message key='Germany.Berlin'/>", "<fmt:message key='Germany.Munich'/>", "<fmt:message key='Germany.Hamburg'/>", "<fmt:message key='Germany.Cologne'/>", "<fmt:message key='Germany.Frankfurt'/>", "<fmt:message key='Germany.Stuttgart'/>", "<fmt:message key='Germany.Düsseldorf'/>", "<fmt:message key='Germany.Leipzig'/>", "<fmt:message key='Germany.Nuremberg'/>", "<fmt:message key='Germany.Dresden'/>"],
		    UnitedKingdom: ["<fmt:message key='UnitedKingdom.London'/>", "<fmt:message key='UnitedKingdom.Edinburgh'/>", "<fmt:message key='UnitedKingdom.Manchester'/>", "<fmt:message key='UnitedKingdom.Birmingham'/>", "<fmt:message key='UnitedKingdom.Liverpool'/>", "<fmt:message key='UnitedKingdom.Glasgow'/>", "<fmt:message key='UnitedKingdom.Leeds'/>", "<fmt:message key='UnitedKingdom.Bristol'/>", "<fmt:message key='UnitedKingdom.Cardiff'/>", "<fmt:message key='UnitedKingdom.Oxford'/>"],
		    Australia: ["<fmt:message key='Australia.Sydney'/>", "<fmt:message key='Australia.Melbourne'/>", "<fmt:message key='Australia.Brisbane'/>", "<fmt:message key='Australia.Perth'/>", "<fmt:message key='Australia.Adelaide'/>", "<fmt:message key='Australia.Hobart'/>", "<fmt:message key='Australia.Cairns'/>", "<fmt:message key='Australia.GoldCoast'/>", "<fmt:message key='Australia.Darwin'/>", "<fmt:message key='Australia.Canberra'/>"],
		    Spain: ["<fmt:message key='Spain.Madrid'/>", "<fmt:message key='Spain.Barcelona'/>", "<fmt:message key='Spain.Seville'/>", "<fmt:message key='Spain.Valencia'/>", "<fmt:message key='Spain.Malaga'/>", "<fmt:message key='Spain.Bilbao'/>", "<fmt:message key='Spain.Granada'/>", "<fmt:message key='Spain.Alicante'/>", "<fmt:message key='Spain.Cordoba'/>", "<fmt:message key='Spain.Salamanca'/>"],
		    Mexico: ["<fmt:message key='Mexico.MexicoCity'/>", "<fmt:message key='Mexico.Cancun'/>", "<fmt:message key='Mexico.Gudalajara'/>", "<fmt:message key='Mexico.Monterrey'/>", "<fmt:message key='Mexico.Oaxaca'/>", "<fmt:message key='Mexico.Tulum'/>", "<fmt:message key='Mexico.Puebla'/>", "<fmt:message key='Mexico.Merida'/>", "<fmt:message key='Mexico.Acapulco'/>", "<fmt:message key='Mexico.Mazatlan'/>"],
		    Brazil: ["<fmt:message key='Brazil.RioDeJaneiro'/>", "<fmt:message key='Brazil.SaoPaulo'/>", "<fmt:message key='Brazil.Brasilia'/>", "<fmt:message key='Brazil.Salvador'/>", "<fmt:message key='Brazil.Fortaleza'/>", "<fmt:message key='Brazil.BeloHorizonte'/>", "<fmt:message key='Brazil.Recife'/>", "<fmt:message key='Brazil.Manaus'/>", "<fmt:message key='Brazil.Curitiba'/>", "<fmt:message key='Brazil.PortoAlegre'/>"],
		    India: ["<fmt:message key='India.NewDelhi'/>", "<fmt:message key='India.Mumbai'/>", "<fmt:message key='India.Goa'/>", "<fmt:message key='India.Kolkata'/>", "<fmt:message key='India.Bangalore'/>", "<fmt:message key='India.Chennai'/>", "<fmt:message key='India.Hyderabad'/>", "<fmt:message key='India.Jaipur'/>", "<fmt:message key='India.Agra'/>", "<fmt:message key='India.Varanasi'/>"],
		    Egypt: ["<fmt:message key='Egypt.Cairo'/>", "<fmt:message key='Egypt.Luxor'/>", "<fmt:message key='Egypt.Giza'/>", "<fmt:message key='Egypt.SharmElSheikh'/>", "<fmt:message key='Egypt.Alexandria'/>", "<fmt:message key='Egypt.Aswan'/>", "<fmt:message key='Egypt.Hurghada'/>", "<fmt:message key='Egypt.Dahab'/>", "<fmt:message key='Egypt.MarsaAlam'/>", "<fmt:message key='Egypt.Fayoum'/>"],
		    SouthAfrica: ["<fmt:message key='SouthAfrica.CapeTown'/>", "<fmt:message key='SouthAfrica.Johannesburg'/>", "<fmt:message key='SouthAfrica.Durban'/>", "<fmt:message key='SouthAfrica.Pretoria'/>", "<fmt:message key='SouthAfrica.PortElizabeth'/>", "<fmt:message key='SouthAfrica.Stellenbosch'/>", "<fmt:message key='SouthAfrica.Knysna'/>", "<fmt:message key='SouthAfrica.Drakensberg'/>", "<fmt:message key='SouthAfrica.GardenRoute'/>", "<fmt:message key='SouthAfrica.SunCity'/>"],
		    Thailand: ["<fmt:message key='Thailand.Bangkok'/>", "<fmt:message key='Thailand.Phuket'/>", "<fmt:message key='Thailand.ChiangMai'/>", "<fmt:message key='Thailand.Pattaya'/>", "<fmt:message key='Thailand.Ayutthaya'/>", "<fmt:message key='Thailand.Krabi'/>", "<fmt:message key='Thailand.KohSamui'/>", "<fmt:message key='Thailand.HuaHin'/>", "<fmt:message key='Thailand.ChiangRai'/>", "<fmt:message key='Thailand.Sukhothai'/>"]
			Argentina: ["<fmt:message key='Argentina.BuenosAires'/>", "<fmt:message key='Argentina.Mendoza'/>", "<fmt:message key='Argentina.Patagonia'/>", "<fmt:message key='Argentina.Cordoba'/>", "<fmt:message key='Argentina.Bariloche'/>", "<fmt:message key='Argentina.Rosario'/>", "<fmt:message key='Argentina.MarDelPlata'/>", "<fmt:message key='Argentina.IguazuFalls'/>", "<fmt:message key='Argentina.Salta'/>", "<fmt:message key='Argentina.Ushuaia'/>"],
    		Russia: ["<fmt:message key='Russia.Moscow'/>", "<fmt:message key='Russia.StPetersburg'/>", "<fmt:message key='Russia.Kazan'/>", "<fmt:message key='Russia.Sochi'/>", "<fmt:message key='Russia.Yekaterinburg'/>", "<fmt:message key='Russia.Novosibirsk'/>", "<fmt:message key='Russia.Vladivostok'/>", "<fmt:message key='Russia.Krasnoyarsk'/>", "<fmt:message key='Russia.Samara'/>", "<fmt:message key='Russia.Volgograd'/>"],
    		Turkey: ["<fmt:message key='Turkey.Istanbul'/>", "<fmt:message key='Turkey.Ankara'/>", "<fmt:message key='Turkey.Cappadocia'/>", "<fmt:message key='Turkey.Antalya'/>", "<fmt:message key='Turkey.Izmir'/>", "<fmt:message key='Turkey.Bodrum'/>", "<fmt:message key='Turkey.Fethiye'/>", "<fmt:message key='Turkey.Pamukkale'/>", "<fmt:message key='Turkey.Konya'/>", "<fmt:message key='Turkey.Mardin'/>"],
    		Switzerland: ["<fmt:message key='Switzerland.Zurich'/>", "<fmt:message key='Switzerland.Geneva'/>", "<fmt:message key='Switzerland.Lucerne'/>", "<fmt:message key='Switzerland.Bern'/>", "<fmt:message key='Switzerland.Basel'/>", "<fmt:message key='Switzerland.Lausanne'/>", "<fmt:message key='Switzerland.Interlaken'/>", "<fmt:message key='Switzerland.Zermatt'/>", "<fmt:message key='Switzerland.Montreux'/>", "<fmt:message key='Switzerland.StMoritz'/>"],
    		Sweden: ["<fmt:message key='Sweden.Stockholm'/>", "<fmt:message key='Sweden.Gothenburg'/>", "<fmt:message key='Sweden.Malmo'/>", "<fmt:message key='Sweden.Kiruna'/>", "<fmt:message key='Sweden.Uppsala'/>", "<fmt:message key='Sweden.Lund'/>", "<fmt:message key='Sweden.Visby'/>", "<fmt:message key='Sweden.Nykoping'/>", "<fmt:message key='Sweden.Ostersund'/>", "<fmt:message key='Sweden.Vasteras'/>"],
    		Portugal: ["<fmt:message key='Portugal.Lisbon'/>", "<fmt:message key='Portugal.Porto'/>", "<fmt:message key='Portugal.Algarve'/>", "<fmt:message key='Portugal.Braga'/>", "<fmt:message key='Portugal.Coimbra'/>", "<fmt:message key='Portugal.Madeira'/>", "<fmt:message key='Portugal.Azores'/>", "<fmt:message key='Portugal.Sintra'/>", "<fmt:message key='Portugal.Evora'/>", "<fmt:message key='Portugal.Funchal'/>"],
    		Norway: ["<fmt:message key='Norway.Oslo'/>", "<fmt:message key='Norway.Bergen'/>", "<fmt:message key='Norway.LofotenIslands'/>", "<fmt:message key='Norway.Stavanger'/>", "<fmt:message key='Norway.Trondheim'/>", "<fmt:message key='Norway.Tromso'/>", "<fmt:message key='Norway.Alesund'/>", "<fmt:message key='Norway.Flam'/>", "<fmt:message key='Norway.Geiranger'/>", "<fmt:message key='Norway.Roros'/>"],
    		Netherlands: ["<fmt:message key='Netherlands.Amsterdam'/>", "<fmt:message key='Netherlands.Rotterdam'/>", "<fmt:message key='Netherlands.Giethoorn'/>", "<fmt:message key='Netherlands.Utrecht'/>", "<fmt:message key='Netherlands.TheHague'/>", "<fmt:message key='Netherlands.Eindhoven'/>", "<fmt:message key='Netherlands.Groningen'/>", "<fmt:message key='Netherlands.Leyden'/>", "<fmt:message key='Netherlands.Delft'/>", "<fmt:message key='Netherlands.Maastricht'/>"],
    		Greece: ["<fmt:message key='Greece.Athens'/>", "<fmt:message key='Greece.Santorini'/>", "<fmt:message key='Greece.Crete'/>", "<fmt:message key='Greece.Mykonos'/>", "<fmt:message key='Greece.Thessaloniki'/>", "<fmt:message key='Greece.Rhodes'/>", "<fmt:message key='Greece.Corfu'/>", "<fmt:message key='Greece.Naxos'/>", "<fmt:message key='Greece.Paros'/>", "<fmt:message key='Greece.Kefalonia'/>"],
    		NewZealand: ["<fmt:message key='NewZealand.Auckland'/>", "<fmt:message key='NewZealand.Queenstown'/>", "<fmt:message key='NewZealand.Rotorua'/>", "<fmt:message key='NewZealand.Wellington'/>", "<fmt:message key='NewZealand.Christchurch'/>", "<fmt:message key='NewZealand.Dunedin'/>", "<fmt:message key='NewZealand.Hamilton'/>", "<fmt:message key='NewZealand.Napier'/>", "<fmt:message key='NewZealand.Taupo'/>", "<fmt:message key='NewZealand.Wanaka'/>"],
    		Indonesia: ["<fmt:message key='Indonesia.Bali'/>", "<fmt:message key='Indonesia.Jakarta'/>", "<fmt:message key='Indonesia.Yogyakarta'/>", "<fmt:message key='Indonesia.Surabaya'/>", "<fmt:message key='Indonesia.Bandung'/>", "<fmt:message key='Indonesia.Medan'/>", "<fmt:message key='Indonesia.Lombok'/>", "<fmt:message key='Indonesia.Makassar'/>", "<fmt:message key='Indonesia.BandaAceh'/>", "<fmt:message key='Indonesia.Malang'/>"],
    		Malaysia: ["<fmt:message key='Malaysia.KualaLumpur'/>", "<fmt:message key='Malaysia.Penang'/>", "<fmt:message key='Malaysia.Langkawi'/>", "<fmt:message key='Malaysia.KotaKinabalu'/>", "<fmt:message key='Malaysia.GeorgeTown'/>", "<fmt:message key='Malaysia.Ipoh'/>", "<fmt:message key='Malaysia.ShahAlam'/>", "<fmt:message key='Malaysia.Melaka'/>", "<fmt:message key='Malaysia.Kuching'/>", "<fmt:message key='Malaysia.JohorBahru'/>"]
		};

	</script>
</body>
</html>
