import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 17, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    });
    fitMapToMarkers(map, markers);
    locateUser(map);
  }
};

const locateUser = (map) => {
  const success = (position) => {
    const pos = [position.coords.longitude, position.coords.latitude];

    let userIcon = document.createElement('div');
    userIcon.innerHTML = '🙋‍♂️';
    userIcon.classList.add('mapIcon');

    // userIcon.style.width = '50px';
    // userIcon.style.height = '50px';
    // userIcon.style.fontSize = '30px';
    // userIcon.style.lineHeight = '50px';
    // userIcon.style.textAlign = 'center';
    // userIcon.style.borderRadius = '25px';
    // userIcon.style.backgroundColor = 'lightblue';
    // userIcon.style.boxShadow = '10px black';
    // userIcon.style.width = '50px';
    // userIcon.innerHTML = '🙋‍♂️';

    // const userIcon = document.createElement('div');
    // userIcon.innerHTML = '🥖';

    new mapboxgl.Marker({ element: userIcon })
        .setLngLat(pos)
        .addTo(map);


    const bounds = map.getBounds().extend(pos);
    map.fitBounds(bounds, { padding: 70, maxZoom: 17, duration: 0 });
  }

  const error = () => {
    console.log('Unable to locate user');
  }

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(success, error);
  } else {
    error();
  }
}

export { initMapbox };
