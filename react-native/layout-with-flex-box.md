## Layout with flex box

You will normally use a combination of
- flexDirection
- alignItems
- justifyContent
to achieve the right layout.

### Flex direction
Adding flexDirection to a component's style determines the primary axis of its layout.
Should the children be organized horizontally (row) or vertically (column)? The default is column.

### Justify Content
Adding justifyContent to a component's style determines the distribution of children along the primary axis.
Should children be distributed at the start, the center, the end, or spaced evenly?
Available options are
- flex-start
- center
- flex-end
- space-around
- space-between.

### Align Items
Adding alignItems to a component's style determines the alignment of children along the secondary axis (if the primary axis is row, then the secondary is column, and vice versa).
Should children be aligned at the start, the center, the end, or stretched to fill?
Available options are
- flex-start,
- center,
- flex-end,
- stretch.
