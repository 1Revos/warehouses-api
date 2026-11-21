<img width="1280" height="853" alt="изображение" src="https://github.com/user-attachments/assets/72e7ff47-8e19-4ea1-93ca-c39e42cc9bdc" />

# Warehouses & Shops API

RESTful JSON API на Ruby on Rails для управления складами, магазинами, товарами и их остатками (складскими и розничными запасами).

## Сущности и связи
* **Warehouses (Склады)** — хранят информацию об адресе, специализации и классе/грейде склада. Связаны с магазинами и товарами.
* **Shops (Магазины)** — привязаны к конкретному складу (`warehouse_id`), имеют название, адрес, город и специализацию.
* **Products (Товары)** — номенклатура товаров (название, цена, срок годности, единица измерения).
* **WarehouseProducts** — промежуточная таблица для учета остатков товаров на складах (`quantity`).
* **ShopProducts** — промежуточная таблица для учета остатков товаров в магазинах (`quantity`).

---

## Установка и запуск

1. Клонируйте репозиторий:
   ```bash
   git clone https://github.com
   cd имя_репозитория
   ```
2. Установите зависимости:
   ```bash
   bundle install
   ```
3. Создайте и мигрируйте базу данных:
   ```bash
   rails db:create db:migrate
   ```
4. Запустите сервер:
   ```bash
   rails server
   ```
По умолчанию API будет доступно по адресу `http://localhost:3000`.

---

## Эндпоинты API

### 1. Склады (`/warehouses`)

| Метод | URL | Описание | Параметры тела запроса (`warehouse`) |
| :--- | :--- | :--- | :--- |
| `GET` | `/warehouses` | Получить список всех складов | — |
| `GET` | `/warehouses/:id` | Получить склад со списком магазинов и товаров | — |
| `POST` | `/warehouses/create` | Создать новый склад | `address`, `specialization`, `grade` |
| `PATCH/PUT` | `/warehouses/:id` | Обновить данные склада | `address`, `specialization`, `grade` |
| `DELETE` | `/warehouses/:id` | Удалить склад | — |

### 2. Магазины (`/shops`)

| Метод | URL | Описание | Параметры тела запроса (`shop`) |
| :--- | :--- | :--- | :--- |
| `GET` | `/shops` | Получить список всех магазинов | — |
| `GET` | `/shops/:id` | Получить магазин с привязанным складом и товарами | — |
| `POST` | `/shops/create` | Создать новый магазин | `name`, `address`, `specialization`, `city`, `warehouse_id` |
| `PATCH/PUT` | `/shops/:id` | Обновить данные магазина | `name`, `address`, `specialization`, `city`, `warehouse_id` |
| `DELETE` | `/shops/:id` | Удалить магазин | — |

### 3. Товары (`/products`)

| Метод | URL | Описание | Параметры тела запроса (`product`) |
| :--- | :--- | :--- | :--- |
| `GET` | `/products` | Получить список всех товаров | — |
| `GET` | `/products/:id` | Получить товар со списком складов и магазинов | — |
| `POST` | `/products/create` | Создать новый товар | `title`, `price`, `expiration_day`, `unit` |
| `PATCH/PUT` | `/products/:id` | Обновить данные товара | `title`, `price`, `expiration_day`, `unit` |
| `DELETE` | `/products/:id` | Удалить товар | — |

### 4. Остатки на складах (`/warehouse_products`)

| Метод | URL | Описание | Параметры тела запроса (`warehouse_product`) |
| :--- | :--- | :--- | :--- |
| `GET` | `/warehouse_products` | Получить все записи о наличии на складах | — |
| `POST` | `/warehouse_products/create` | Добавить товар на склад | `warehouse_id`, `product_id`, `quantity` |
| `PATCH/PUT` | `/warehouse_products/:id` | Изменить количество товара на складе | `warehouse_id`, `product_id`, `quantity` |
| `DELETE` | `/warehouse_products/:id` | Убрать товар со склада | — |

### 5. Остатки в магазинах (`/shop_products`)

| Метод | URL | Описание | Параметры тела запроса (`shop_product`) |
| :--- | :--- | :--- | :--- |
| `GET` | `/shop_products` | Получить все записи о наличии в магазинах | — |
| `POST` | `/shop_products/create` | Добавить товар в магазин | `shop_id`, `product_id`, `quantity` |
| `PATCH/PUT` | `/shop_products/:id` | Изменить количество товара в магазине | `shop_id`, `product_id`, `quantity` |
| `DELETE` | `/shop_products/:id` | Убрать товар из магазина | — |

---

## Пример JSON-запроса (`POST /shops`)

```json
{
  "shop": {
    "name": "Продукты 24",
    "address": "ул. Ленина, 10",
    "specialization": "Розничная торговля",
    "city": "Москва",
    "warehouse_id": 1
  }
}
```

## Коды ответов
* `200 OK` — успешное выполнение запроса (`GET`, `PATCH/PUT`, `DELETE`).
* `201 Created` — ресурс успешно создан (`POST`).
* `422 Unprocessable Entity` — ошибка валидации переданных данных (в ответе возвращается JSON со списком ошибок).

