import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 17, duration: 0 });
};



const initMapbox = () => {
  const mapElement = document.getElementById('map')
  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/hongleang/ckpqfurq90eix17p7vwx5rklh'
    });

    const markers = JSON.parse(mapElement.dataset.markers);

    markers.forEach((marker) => {
      let icon = document.createElement('div');
      icon.innerHTML = '🥖';
      icon.classList.add('map-icon');

      new mapboxgl.Marker({ element: icon })
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    });

    fitMapToMarkers(map, markers);
    addUserIcon(map);
  }
};

const addUserIcon = (map) => {
  const success = (position) => {
    const pos = [position.coords.longitude, position.coords.latitude];

    let icon = document.createElement('div');
    icon.innerHTML = '🙋‍♂️';
    icon.classList.add('map-icon');

    new mapboxgl.Marker({ element: icon })
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
