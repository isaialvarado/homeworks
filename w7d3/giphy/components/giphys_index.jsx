import React, { Component } from 'react';
import GiphysIndexItems from './giphys_index_items';

const GiphysIndex = ({giphys}) => {
  const giphyIndexItems = giphys.map((giphy, i) => (
    <GiphysIndexItems key={i} giphy={giphy}/>
  ));

  return (
    <div>
      {giphyIndexItems}
    </div>
  );
};

export default GiphysIndex;
