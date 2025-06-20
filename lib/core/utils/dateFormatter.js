// utils/dateFormatter.js
export function formatDate(date) {
  return date.toISOString().split('T')[0];
}
