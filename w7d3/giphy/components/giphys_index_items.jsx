import React, { Component } from 'react';

const GiphysIndexItems = ({giphy}) => (
  <figure>
    <img src={giphy.images.fixed_height.url} alt="giphy image"></img>
  </figure>
);

export default GiphysIndexItems;
