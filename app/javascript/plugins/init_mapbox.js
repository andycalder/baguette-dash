import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 });
};



const initMapbox = () => {
  const mapElement = document.getElementById('map')
  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      // add new custom style
      style: 'mapbox://styles/hongleang/ckpqfurq90eix17p7vwx5rklh'
    });
    
    const markers = JSON.parse(mapElement.dataset.markers);

    markers.forEach((marker) => {
      // const popup = new mapboxgl.Popup().setHTML(marker.info_window);

      // create a custom Marker
      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '35px';
      element.style.height = '35px';
      element.setAttribute('data-marker-id', marker.ref)

      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    });
    fitMapToMarkers(map, markers)
  }
};

export { initMapbox };