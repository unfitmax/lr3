--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `id_c` int(11) NOT NULL,
  `name_c` varchar(255) NOT NULL,
  `id_sale` int(11) NOT NULL,
  `id_name` int(11) NOT NULL,
  `num_body_c` int(11) NOT NULL,
  `num_engine_c` int(11) NOT NULL,
  `num_pts_c` int(11) NOT NULL,
  `colour_c` varchar(255) NOT NULL,
  `date_create_c` date NOT NULL,
  `date_get_c` date NOT NULL,
  `competition_c` varchar(255) NOT NULL,
  `producer_c` varchar(255) NOT NULL,
  `id_producer` int(11) NOT NULL,
  `price_c` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `employee`
--

CREATE TABLE `employee` (
  `id_e` int(11) NOT NULL,
  `name_empl_e` varchar(255) NOT NULL,
  `status_e` varchar(255) NOT NULL,
  `adress_e` varchar(255) NOT NULL,
  `number_e` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `producer`
--

CREATE TABLE `producer` (
  `id_p` int(11) NOT NULL,
  `name_producer_p` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `request`
--

CREATE TABLE `request` (
  `id_r` int(11) NOT NULL,
  `name_car_r` varchar(255) NOT NULL,
  `in_total_cars_r` int(11) NOT NULL,
  `total_r` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sale`
--

CREATE TABLE `sale` (
  `id_s` int(11) NOT NULL,
  `id_car` int(11) NOT NULL,
  `date_stock_s` date NOT NULL,
  `secondname_buyer_s` varchar(255) NOT NULL,
  `name_buyer_s` varchar(255) NOT NULL,
  `city_s` varchar(255) NOT NULL,
  `adres_s` varchar(255) NOT NULL,
  `pasport_id_s` varchar(255) NOT NULL,
  `tel_num_s` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id_st` int(11) NOT NULL,
  `status_name_st` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id_c`),
  ADD KEY `id_employee` (`id_employee`),
  ADD KEY `id_name` (`id_name`),
  ADD KEY `id_producer` (`id_producer`),
  ADD KEY `id_sale` (`id_sale`);

--
-- Индексы таблицы `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_e`);

--
-- Индексы таблицы `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`id_p`);

--
-- Индексы таблицы `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id_r`);

--
-- Индексы таблицы `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id_s`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_st`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `id_c` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `employee`
--
ALTER TABLE `employee`
  MODIFY `id_e` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `producer`
--
ALTER TABLE `producer`
  MODIFY `id_p` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `request`
--
ALTER TABLE `request`
  MODIFY `id_r` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sale`
--
ALTER TABLE `sale`
  MODIFY `id_s` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id_st` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`id_employee`) REFERENCES `employee` (`id_e`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`id_name`) REFERENCES `request` (`id_r`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cars_ibfk_3` FOREIGN KEY (`id_producer`) REFERENCES `producer` (`id_p`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cars_ibfk_4` FOREIGN KEY (`id_sale`) REFERENCES `sale` (`id_s`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `status_ibfk_1` FOREIGN KEY (`id_st`) REFERENCES `employee` (`id_e`) ON UPDATE CASCADE;
COMMIT;