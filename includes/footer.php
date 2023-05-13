

<footer class="bg-light py-4">
        <div class="container">
            <p class="text-center m-0 p-0">Copyrights &copy; eStore, 2023.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script>
        if(document.getElementById('search')) {
            document.getElementById('search').addEventListener('keyup', (e) => {
                switch(e.keyCode) {
                    case 13:
                        window.location.href = `http://localhost/e-commerce/shop.php?search=${e.target.value}`
                        break
                }
            })
        }
</script>
<?php
// Define the API endpoint URL and the API key
$endpoint = "https://api.openweathermap.org/data/2.5/weather";
$apiKey = "2a1d1e901fd14da5a91e00522576195d";

// Define the city and country code for the weather information you want to retrieve
$city = "Pristina";
$countryCode = "xk";

// Build the API request URL with the city, country code, and API key
$requestUrl = $endpoint . "?q=" . $city . "," . $countryCode . "&appid=" . $apiKey;

// Send the API request and get the response data
$response = file_get_contents($requestUrl);

// Parse the response data as JSON
$weatherData = json_decode($response, true);

// Extract the temperature and weather description from the weather data
$temperature = $weatherData["main"]["temp"];
$description = $weatherData["weather"][0]["description"];

// Print out the temperature and weather description
echo "The temperature in " . $city . " is " . $temperature . " Kelvin. The weather is " . $description . ".";
?>
</body>
</html>
