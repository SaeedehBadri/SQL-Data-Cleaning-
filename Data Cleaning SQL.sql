--Cleaning Data in SQL

Select *
From PorfolioProject2.[dbo].[NashvilleHousing]


Select SaleDateConverted, CONVERT(Date,SaleDateConverted)
From PorfolioProject2.[dbo].[NashvilleHousing]

Update NashvilleHousing
SET SaleDateConverted = CONVERT(Date,SaleDateConverted)

select SaleDateConverted 
From PorfolioProject2.[dbo].[NashvilleHousing]

--Alter Table [dbo].[NashvilleHousing]
--add SaleDateConverted Date;
--Update [dbo].[NashvilleHousing]
--SET SaleDateConverted = CONVERT(Date,SaleDateConverted)

---Populate Property Address data

Select *
From PorfolioProject2.[dbo].[NashvilleHousing]
Where PropertySplitAddress is not null
order by ParcelID


Select a.ParcelID, a.PropertySplitAddress, b.ParcelID, b.PropertySplitAddress, ISNULL(a.PropertySplitAddress,b.PropertySplitAddress)
From  PorfolioProject2.[dbo].[NashvilleHousing]a
JOIN PorfolioProject2.[dbo].[NashvilleHousing] b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertySplitAddress is not null

--when you update and join you can not go with the same name you will get error , its better go with aliase 
Update a
SET PropertySplitAddress = ISNULL(a.PropertySplitAddress,b.PropertySplitAddress)
From  PorfolioProject2.[dbo].[NashvilleHousing]a
JOIN PorfolioProject2.[dbo].[NashvilleHousing] b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertySplitAddress is null


 --Breaking out Address into Individual Columns (Address, City, State)

Select PropertySplitAddress
From PorfolioProject2.[dbo].[NashvilleHousing]
Where PropertySplitAddress is not null
order by ParcelID,SalePrice,YearBuilt



Select PropertySplitAddress
From PorfolioProject2.[dbo].[NashvilleHousing]


Select
PARSENAME(REPLACE(PropertySplitAddress, ',', '.') , 3)
,PARSENAME(REPLACE(PropertySplitAddress, ',', '.') , 2)
,PARSENAME(REPLACE(PropertySplitAddress, ',', '.') , 1)
From PorfolioProject2.[dbo].[NashvilleHousing]



----------------------------------------------------------------------------------------------------------------------------


---- Change Y and N to Yes and No in "Sold as Vacant" field
Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From PorfolioProject2.[dbo].[NashvilleHousing]
Group by SoldAsVacant
order by 2




Select SoldAsVacant
, CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
From PorfolioProject2.[dbo].[NashvilleHousing]


Update NashvilleHousing
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From PorfolioProject2.[dbo].[NashvilleHousing]
Group by SoldAsVacant
order by 2


-- Remove Duplicates ,row_number and partition by ,order by, 
-- WITH RowNumCTE AS(
--Select *,
--	ROW_NUMBER() OVER (
--	PARTITION BY ParcelID,
--				 PropertyAddress,
--				 SalePrice,
--				 SaleDate,
--				 LegalReference
--				 ORDER BY
--					UniqueID
--					) row_num

--From PorfolioProject2.[dbo].[NashvilleHousing]
--order by ParcelID
--)
--select * 
--From RowNumCTE
--Where row_num > 1
--Order by PropertySplitAddress

-----------------------------------------------------------------------------------------------------------

---- Delete Unused Columns .Alter table, drop 

--Select *
--From PorfolioProject2.[dbo].[NashvilleHousing]
--ALTER TABLE [PorfolioProject2].[dbo].[NashvilleHousing]
--Drop Column Acreage 



























