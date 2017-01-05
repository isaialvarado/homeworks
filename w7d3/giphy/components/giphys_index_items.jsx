import React, { Component } from 'react';

const GiphysIndexItems = ({giphy}) => (
  <figure>
    <img src={giphy.images.fixed_height.url} />
  </figure>
);

export default GiphysIndexItems;
