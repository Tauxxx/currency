const cache = new Map();
const TTL = 60 * 60 * 1000;

export function getCache(key) {
  const item = cache.get(key);
  if (!item) return null;
  if (Date.now() > item.exp) {
    cache.delete(key);
    return null;
  }
  return item.val;
}

export function setCache(key, val) {
  cache.set(key, { val, exp: Date.now() + TTL });
}