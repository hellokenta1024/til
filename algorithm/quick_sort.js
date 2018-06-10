let arr = [3, 5, 8, 2, 1];
console.log(quickSort(arr));


function quickSort(arr) {
  
  return quickSortPrivate(arr, 0, arr.length - 1);
}

function quickSortPrivate(arr, left, right) {
  if (left >= right) { return }
  
  let pivot = arr[left];
  
  let partIndex = partition(arr, left, right, pivot);
  
  if (left === partIndex) { return }
  
  quickSortPrivate(arr, left, partIndex-1);
  quickSortPrivate(arr, partIndex, right);
  
  return arr;
}

function partition(arr, left, right, pivot) {
  
    while (left < right) {
      
      if (arr[left] < pivot) {
        left++;
      }
      
      if (pivot <= arr[right]) {
        right--;
      }
      
      if (pivot <= arr[left] && arr[right] < pivot) {
        
        swap(arr, left, right);
        left++;
        right--;
      }
    }
  
  return left;
}

function swap(arr, i, j) {
  
  let tmp = arr[i];
  arr[i] = arr[j];
  arr[j] = tmp;
}